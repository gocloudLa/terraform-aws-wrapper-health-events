module "wrapper_health_events" {

  source = "../../"

  metadata = local.metadata

  health_events_parameters = {
    enable = true # default false
    # email  = "xxxxxx@gmail.com"
    # sns_topics_targets = []
    # excluded_event_type_codes = ["AWS_VPN_REDUNDANCY_LOSS", "AWS_ECS_TASK_PATCHING_RETIREMENT"]
    # excluded_services = ["VPN", "ECS"]
  }
  health_events_defaults = var.health_events_defaults
}