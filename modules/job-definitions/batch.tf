resource "aws_batch_job_definition" "batch_job_definition" {

    for_each = var.image_names
    name = each.key

    tags = {
        Terraform   = true
        Owner       = var.owner
        Name        = each.key
    }  
  
    type = "container"
    container_properties = <<CONTAINER_PROPERTIES
{
        "image": "${var.account_id}.dkr.ecr.eu-west-1.amazonaws.com/${each.key}",
        "executionRoleArn": "${var.execution_role_arn}",
        "jobRoleArn": "${var.job_role_arn}",
        "vcpus": 1,
        "memory": 2048,
    }
CONTAINER_PROPERTIES
}

resource "aws_batch_job_definition" "batch_job_definition_on_demand" {

    for_each = var.image_names_on_demand
    name = "${each.key}-${var.on_demand_suffix}"

    tags = {
        Terraform   = true
        Owner       = var.owner
        Name        = each.key
    }  
  
    type = "container"
    container_properties = <<CONTAINER_PROPERTIES
{
        "image": "${var.account_id}.dkr.ecr.eu-west-1.amazonaws.com/${each.key}",
        "executionRoleArn": "${var.execution_role_arn}",
        "jobRoleArn": "${var.job_role_arn}",
        "vcpus": 24,
        "memory": 50000,
    }
CONTAINER_PROPERTIES
}


resource "aws_batch_job_definition" "batch_job_definition_memory" {

    for_each = var.image_names_memory
    name = "${each.key}-${var.memory_suffix}"

    tags = {
        Terraform   = true
        Owner       = var.owner
        Name        = each.key
    }  
  
    type = "container"
    container_properties = <<CONTAINER_PROPERTIES
{
        "image": "${var.account_id}.dkr.ecr.eu-west-1.amazonaws.com/${each.key}",
        "executionRoleArn": "${var.execution_role_arn}",
        "jobRoleArn": "${var.job_role_arn}",
        "vcpus": 4,
        "memory": 32768,
    }
CONTAINER_PROPERTIES
}
