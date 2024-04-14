resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "pipeline-artifacts-fatema"
  acl    = "private"
} 

# Define the S3 bucket for hosting the static website
resource "aws_s3_bucket" "bucket" {
  bucket = "my-static-website-fatema001"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
  
}

resource "aws_s3_bucket_object" "file_upload" {
  for_each = fileset("${path.module}/static", "**")
    bucket = aws_s3_bucket.bucket.id
    key = each.value
    source = "${path.module}/static/${each.value}"
    etag = filemd5("${path.module}/static/${each.value}") 
}