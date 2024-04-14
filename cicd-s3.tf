resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "pipeline-artifacts-fatema"
  acl    = "private"
} 

# Define the S3 bucket for hosting the static website
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "my-static-website-fatema"  # Update with your desired bucket name
  acl    = "public-read"

  provisioner "local-exec" {
    command = "aws s3 sync static/ s3://${aws_s3_bucket.static_website_bucket} --acl public-read --delete"
    
  }
  # Set the index document for the bucket
  # This will serve index.html as the default document
  website {
    index_document = "index.html"
  }
}

