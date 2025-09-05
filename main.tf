module "health_events" {
  source = "./modules/aws/terraform-aws-health"
  enable = try(var.health_events_parameters.enable, false)

  event_bus_name         = try(var.health_events_parameters.event_bus_name, var.health_events_defaults.event_bus_name, "default")
  sns_topics_targets     = try(var.health_events_parameters.sns_topics_targets, var.health_events_defaults.sns_topics_targets, [])
  email                  = try(var.health_events_parameters.email, var.health_events_defaults.email, null)
  default_sns_topic_name = "${local.common_name}-alerts"

  # Health Issue Notification 
  name_issue        = "${local.common_name}-issue"
  description_issue = "AWS Health - Open Issues"
  event_pattern_issue = jsonencode({
    "source" : ["aws.health"],
    "detail-type" : ["AWS Health Event"]
    "detail" : {
      "eventTypeCategory" : ["issue"]
      "eventScopeCode" : ["ACCOUNT_SPECIFIC"]
    }
  })

  # Health Schedule And Account Notification 
  name_schedule_and_account        = "${local.common_name}-scheduled-account"
  description_schedule_and_account = "AWS Health - Scheduled Changes & Account Notifications"
  event_pattern_schedule_and_account = jsonencode({
    "source" : ["aws.health"],
    "detail-type" : ["AWS Health Event"]
    "detail" : {
      "eventTypeCategory" : ["scheduledChange", "accountNotification"]
    }
  })

  tags = merge(local.common_tags, try(var.health_events_parameters.tags, var.health_events_defaults.tags, null))
}