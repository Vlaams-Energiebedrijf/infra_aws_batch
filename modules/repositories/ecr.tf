resource "aws_ecr_repository" "ecr_repository" {
  for_each = var.ecr_repository_names

  name                 = each.key
  image_tag_mutability = "MUTABLE"

  tags = {
    Environment = var.environment
    Terraform   = true
    Owner       = var.owner
    Name        = each.key
  }
}

resource "aws_ecr_lifecycle_policy" "ecr_policy" {
  for_each   = var.ecr_repository_names
  repository = each.key


  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 3 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 3
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF

  depends_on = [aws_ecr_repository.ecr_repository]
}
