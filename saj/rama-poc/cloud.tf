provider "aws" {
    region = "sa-east-1"
}

terraform {
    backend "s3" {
        bucket = "softplan-sa-east1-rama-tfstate"
        key    = "unj/platform-saj/sa-east-1/terraform.tfstate"
        region = "sa-east-1"
    }
}
