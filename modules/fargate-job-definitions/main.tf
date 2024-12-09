resource "aws_batch_job_definition" "fargate_batch_job_definition" {

    for_each = {for fargate_batch_job_definition in var.fargate_jobs:  fargate_batch_job_definition.index => fargate_batch_job_definition}
    name = "${each.value.environment}-${each.value.job_name}-${each.value.vcpu}-${each.value.memory}"

    tags = {
        Terraform   = true
        Owner       = var.owner
        Environment = each.value.environment
        Name        = each.value.job_name
    } 

    type = "container"

    platform_capabilities = [
        "FARGATE",
    ]

    container_properties = jsonencode({
        command = []

        environment = []

        image   = "${var.account_id}.dkr.ecr.eu-west-1.amazonaws.com/${each.value.environment}-${each.value.job_name}"

        fargatePlatformConfiguration = {
            platformVersion = "LATEST"
        }

        networkConfiguration = {
            assignPublicIp = "ENABLED"
        }

        resourceRequirements = [
            {
                type  = "VCPU"
                value = each.value.vcpu
            },
            {
                type  = "MEMORY"
                value = each.value.memory
            }
        ]
        jobRoleArn = var.job_role_arn
        executionRoleArn = var.execution_role_arn 
        }
    )
}
