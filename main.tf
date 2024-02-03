# Create an s3 bucket that is using in python scripts to save their output
resource "aws_s3_bucket" "logs_bucket" {
  bucket = "pr-microservices-logs-mhmdrza" # Change this to your desired bucket name
}