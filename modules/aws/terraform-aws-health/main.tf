resource "aws_cloudwatch_event_rule" "health_event_issue" {
  count = var.enable ? 1 : 0

  name                = var.name_issue
  name_prefix         = null
  description         = var.description_issue
  event_bus_name      = var.event_bus_name
  event_pattern       = var.event_pattern_issue
  schedule_expression = null
  force_destroy       = false
  role_arn            = null
  state               = null

  tags = var.tags
}

resource "aws_cloudwatch_event_rule" "health_event_schedule_and_account" {
  count = var.enable ? 1 : 0

  name                = var.name_schedule_and_account
  name_prefix         = null
  description         = var.description_schedule_and_account
  event_bus_name      = var.event_bus_name
  event_pattern       = var.event_pattern_schedule_and_account
  schedule_expression = null
  force_destroy       = false
  role_arn            = null
  state               = null

  tags = var.tags
}

locals {
  # Si está habilitado y no hay sns_topics_targets, se usa default
  enable_sns_default = (
  try(var.enable, false) && length(try(var.sns_topics_targets, [])) == 0) ? 1 : 0
}

data "aws_sns_topic" "default" {
  count = local.enable_sns_default
  name  = var.default_sns_topic_name
}

locals {
  # Armo el objeto tanto si hay targets personalizados o si se usa el default
  alarm_targets_sns_tmp = (length(try(var.sns_topics_targets, []))
  > 0 ? var.sns_topics_targets : [try(data.aws_sns_topic.default[0].arn, "")])

  alarm_targets_sns_issue = {
    for target in local.alarm_targets_sns_tmp : "issue" => {
      rule_name      = try(aws_cloudwatch_event_rule.health_event_issue[0].name, "")
      target_arn     = target
      event_bus_name = var.event_bus_name
    } if var.enable
  }
  alarm_targets_sns_schedule_and_account = {
    for target in local.alarm_targets_sns_tmp : "schedule" => {
      rule_name      = try(aws_cloudwatch_event_rule.health_event_schedule_and_account[0].name, "")
      target_arn     = target
      event_bus_name = var.event_bus_name
    } if var.enable
  }

  alarm_targets_sns = merge(local.alarm_targets_sns_issue, local.alarm_targets_sns_schedule_and_account)

}

resource "aws_cloudwatch_event_target" "sns" {
  for_each = local.alarm_targets_sns

  rule           = each.value.rule_name
  arn            = each.value.target_arn
  event_bus_name = each.value.event_bus_name
}

resource "aws_sns_topic_subscription" "email" {
  for_each = (var.email != null ?
  { for target, value in local.alarm_targets_sns : target => value.target_arn } : {})

  topic_arn = each.value
  protocol  = "email"
  endpoint  = var.email
}