resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "pipeline-artifacts-fatema"
  acl    = "private"
} 

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "my-static-website-fatema"  # Update with your desired bucket name

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "static_website_bucket_policy" {
  bucket = aws_s3_bucket.static_website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "PublicReadGetObject",
        Effect = "Allow",
        Principal = "*",
        Action = ["s3:GetObject"],
        Resource = aws_s3_bucket.static_website_bucket.arn,
      },
    ],
  })
}
