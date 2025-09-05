/*----------------------------------------------------------------------*/
/* Health Events | Variable Definition                                  */
/*----------------------------------------------------------------------*/

variable "enable" {
  type        = bool
  description = ""
  default     = false
}

variable "name_issue" {
  type        = string
  description = ""
  default     = null
}

variable "description_issue" {
  type        = string
  description = ""
  default     = null
}

variable "name_schedule_and_account" {
  type        = string
  description = ""
  default     = null
}

variable "description_schedule_and_account" {
  type        = string
  description = ""
  default     = null
}

variable "event_bus_name" {
  type        = string
  description = ""
  default     = null
}

variable "event_pattern_issue" {
  type        = any
  description = ""
  default     = {}
}

variable "event_pattern_schedule_and_account" {
  type        = any
  description = ""
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "sns_topics_targets" {
  type        = list(string)
  description = ""
  default     = []
}

variable "email" {
  type        = string
  description = ""
  default     = null
}

variable "default_sns_topic_name" {
  type        = string
  description = ""
  default     = ""
}