resource "aws_batch_job_definition" "fargate_batch_job_definition" {

    for_each = var.fargate_jobs
    name = each.value.job_name

    tags = {
        Terraform   = true
        Owner       = var.owner
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
