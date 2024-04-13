resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "pipeline-artifacts-fatema"
  acl    = "private"
} 

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "my-static-website-bucket-fatema"  # Replace with your desired bucket name
  acl    = "public-read"  # Allow public read access to the bucket

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

