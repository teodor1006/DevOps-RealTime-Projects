terraform {
  backend "s3" {
    encrypt = true
    bucket = "static-website-training-98"
    dynamodb_table = "static-website-lock"
    key = "my-static-website-training-98.tfstate"
    region = "us-east-1"    
  }
}