terraform {
  backend "s3" {
    bucket = "terra-17-06-2024"
    key     = "dev/terraform.tfstate"
    region = "us-west-2"
    
  }
}