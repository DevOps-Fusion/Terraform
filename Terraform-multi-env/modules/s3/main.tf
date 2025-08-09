resource "aws_s3_bucket" "bucket" {
  bucket = "${var.env}-mybucket-${random_id.suffix.hex}"
  acl    = "private"

  tags = {
    Name = "${var.env}-s3-bucket"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}
