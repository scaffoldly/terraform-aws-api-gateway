resource "aws_iam_role" "api_gateway_cloudwatch" {
  name = "api-gateway-cloudwatch"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "api_gateway_cloudwatch" {
  name = "default"
  role = aws_iam_role.api_gateway_cloudwatch.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_api_gateway_account" "account" {
  cloudwatch_role_arn = aws_iam_role.api_gateway_cloudwatch.arn
}

module "domain" {
  source  = "scaffoldly/api-gateway-domain/aws"
  version = "0.15.1"

  for_each = var.stage_domains

  dns_provider    = lookup(each.value, "dns_provider", "unknown-dns-provider")
  dns_domain_id   = lookup(each.value, "dns_domain_id", "unknown-dns-domain-id")
  domain          = lookup(each.value, "serverless_api_domain", "unknown-domain")
  certificate_arn = lookup(each.value, "certificate_arn", "unknown-arn")

  providers = {
    aws.dns = aws.dns
  }
}
