terraform{
    backend "s3" {
        bucket = "aws-cicd-pipeline-fatema"
        encrypt = true
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
}