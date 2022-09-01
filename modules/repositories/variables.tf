variable "ecr_repository_names" {
  description = "A list containing names of ecr repositories to be made."
  type        = set(string)
}

variable "environment" {
  description = "Which environment this module needs to be deployed to."
  type        = string
}

variable "owner" {
  description = "Name of the owner of the resources. (team name)"
  type        = string
  default     = "Data Team"
}
