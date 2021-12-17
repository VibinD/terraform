provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_appsync_graphql_api" "tf-test-graphql-api" {
  authentication_type = "API_KEY"
  name                = "terraform-test-api"
}
