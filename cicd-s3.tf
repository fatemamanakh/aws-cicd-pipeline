resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "pipeline-artifacts-fatema"
  acl    = "private"
} 

# Define the S3 bucket for hosting the static website
resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "pipeline-artifacts-fatema"
  acl    = "private"
} 

# Define the S3 bucket for hosting the static website
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "my-static-website-fatema"
  acl    = "public-read"

  # Set the index document for the bucket
  # This will serve index.html as the default document
  website {
    index_document = "index.html"
  }
}

# Upload all files from the 'static' folder to the root of the S3 bucket
resource "aws_s3_bucket_object" "website_content" {
  bucket = aws_s3_bucket.static_website_bucket.id

  # Recursively find all files within the 'static' folder
  for_each = fileset("${path.module}/static", "**/*")
  key = each.value

  # Upload each file to the bucket
  source  = "${path.module}/static/${each.value}"  # Path to the file on your filesystem
  etag    = filemd5("${path.module}/static/${each.value}")  # Calculate ETag for each file
  content_type = lookup({
    ".html" = "text/html",
    ".css"  = "text/css",
    ".js"   = "application/javascript",
    ".png"  = "image/png",
    ".jpg"  = "image/jpeg",
    ".jpeg" = "image/jpeg",
    ".gif"  = "image/gif",
    ".webp" = "image/webp",  # MIME type for WebP files
  }, fileext("${path.module}/static/${each.value}"), "application/octet-stream")
}
