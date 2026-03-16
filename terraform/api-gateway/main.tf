resource "aws_api_gateway_rest_api" "REST_API" {
  name        = var.rest_api_name
  description = var.rest_api_description
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.REST_API.id
  parent_id   = aws_api_gateway_rest_api.REST_API.root_resource_id
  path_part   = var.resource
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.REST_API.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = var.http_method
  authorization = var.authorization
}