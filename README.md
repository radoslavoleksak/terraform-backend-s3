# terraform-state-s3

```
module "terraform-backend-s3" {
    source = "github.com/radoslavoleksak/terraform-backend-s3"

    aws_access_key  = "${var.aws_access_key}"
    aws_secret_key  = "${var.aws_secret_key}"
    aws_region      = "${var.aws_region}"

    storage_bucket  = "com.example.test.terraform.state.storage"
    storage_name    = "example.com [test] - Terraform State Store"
    storage_env     = "test"
    db_table_name   = "com.example.test.terraform.state.table"
}
```

```
terraform {
    backend "s3" {
        bucket         = "com.example.test.terraform.state.storage"
        key            = "terraform_examplecom.tfstate"
        region         = "eu-central-1"
        acl            = "private"
        dynamodb_table = "com.example.test.terraform.state.table"
    }
}
```