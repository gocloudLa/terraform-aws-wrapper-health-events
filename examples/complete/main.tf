module "wrapper_health_events" {

  source = "../../"

  metadata = local.metadata

  health_events_parameters = {
    enable = true # default false
    #email  = "xxxxxx@gmail.com"
    #sns_topics_targets = []
  }
  health_events_defaults = var.health_events_defaults
}