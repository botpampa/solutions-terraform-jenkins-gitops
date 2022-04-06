variable "project_id" {
  type        = string
  description = "Project ID of GCP project to be used"
  default     = ""
}

variable "environment" {
  type        = string
  description = "Name of the environment (dev or prod)"
  default     = "dev"
}