variable "ecr_repository_names" {
  description = "A list containing names of ecr repositories to be made."
  type        = set(string)
}

variable "owner" {
  description = "Name of the owner of the resources. (team name)"
  type        = string
  default     = "Data Team"
}
