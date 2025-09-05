/*----------------------------------------------------------------------*/
/* Billing | Variable Definition                                        */
/*----------------------------------------------------------------------*/

variable "health_events_parameters" {
  type        = any
  description = ""
  default     = {}
}

variable "health_events_defaults" {
  description = "Map of default values which will be used for each item."
  type        = any
  default     = {}
}