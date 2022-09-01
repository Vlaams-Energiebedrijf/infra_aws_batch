variable "image_names" {
  description = "A list containing images for which we want to create job definition."
  type        = set(string)
}

variable "environment" {
  description = "Which environment this module needs to be deployed to."
  type        = string
}

variable "account_id" {
  description = "account id"
  type        = string
}

variable "owner" {
  description = "Name of the owner of the resources. (team name)"
  type        = string
  default     = "Data Team"
}

variable "execution_role_arn" {
  description = "The Amazon Resource Name (ARN) of the execution role that AWS Batch can assume. The execution role grants the Amazon ECS container and AWS Fargate agents permission to make AWS API calls on your behalf."
  type        = string
}

variable "job_role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role that the container can assume for AWS permissions. With IAM roles for Amazon ECS tasks, you can specify an IAM role that can be used by the containers in a task."
  type        = string
}

variable "image_names_on_demand" {
  description = "A list containing images for which we want to create on demand job definition on a big server."
  type        = set(string)
}

variable "on_demand_suffix" {
  description = "on demand suffix"
  type = string
  default = "on-demand"
}

variable "image_names_memory" {
  description = "A list containing images for which we want to create on demand job definition on a big server."
  type        = set(string)
}

variable "memory_suffix" {
  description = "on demand suffix"
  type = string
  default = "memory"
}