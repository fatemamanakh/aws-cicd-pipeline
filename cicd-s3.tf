# Define the S3 bucket for hosting the static website
resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "my-static-website-fatema"  # Update with your desired bucket name

  # Set the index document for the bucket
  # This will serve index.html as the default document
  website {
    index_document = "index.html"
  }
}

# Upload static website content to the S3 bucket
resource "aws_s3_bucket_object" "website_objects" {
  bucket = aws_s3_bucket.static_website_bucket.id

  # Specify the source directory containing your static website content
  # Here, assuming the website content is located in the "website" directory
  source = "website/"

  # Specify the destination directory in the S3 bucket
  # Here, assuming the content should be placed at the root of the bucket
  # Adjust the "key" attribute as needed to place the content in a subdirectory
  key    = ""

  # Set ACL to public-read for public access
  acl    = "public-read"
}
