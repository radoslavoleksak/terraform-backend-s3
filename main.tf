provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

resource "aws_s3_bucket" "backend_storage" {
    bucket = "${var.storage_bucket}"

    tags {
        Name        = "${var.storage_name}"
        Environment = "${var.storage_env}"
    }

    versioning {
        enabled = true
    }
}

resource "aws_dynamodb_table" "backend_db_table" {
    name           = "${var.db_table_name}"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}