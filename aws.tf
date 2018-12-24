aws_access_key_id = AKIAJLOADUIDSW6VGHFQ
aws_secret_access_key = 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
variable "aws_access_key"
variable "aws_secret_key"
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}
resource "aws_key_pair" "first_keypair.pem" {
key_name = "first_keypair.pem"
public_key = "MIIEowIBAAKCAQEApQlIL8h2Xw6/XmsAOKaqYqHAFsJN+2zf476jhfyI4/NVJ9mvm7Ay7/MHe50m
vS/oVMTctO5Q+xivdNIJV6NWleuN+2h66GWYIEnuFIuwjzlp/fB2gqqo1BEeKfyREZM1+Q3bQ+A7
1HIgnC6PfUlumxSVM2pxj46PTBXnQ7rMTGvOVXvk5BTgkT7rz3AyNrslw/2QTmTkVAYAX++uGVeu
ylIXHrfSkarj/KwvmoiOzIFSRa5thhRwHFw5Xt6MnHWvBEbASWN9h4UbXVGxtkzZ50SusTattfJG
gMtQRMs8+I7YfVI+7skAfsTRZBfwqCFmxy01p90ttF0s2uzECJu0DQIDAQABAoIBACu7N+uhfOxX
ZhJI3DgmwcN9BP+C4VMcWH9qxr38WvG8SvZSUpw4pma6yWLSE6/SAAhmWe1/sOm4ctXLyjn0yD7V
ujvCRb9LHHKB5JqBIXnyRsnJbD3XpwD6wDlz+aTkk0q5hz6HLpNu4oFAPTl/udVSMO7857aYmhQZ
QbzKxNQC1+U+eTNn9NA9liukxtyJN5MD8AkIwJKsHsf2RNpBtYsSxMqHaUxRntfH2G5au89ti+Ai
2G/cNxKFimSItcpHbitPeUAlrMvXxrGWQXDtkHJna4IthAICJTZNZ29YwDi1Nuye/43wz+f+n4uw
Z1qgusdDVOcOa4mMOCIOOtR4YykCgYEA3Nj7JqFBHFER2teJwb+ohErUgxL7IhDnTaCZY+67MqaE
M+5CZX4ivjBWoykXyJIKr/yGNh+ugSgEQOHaZB5r8fCz1JHsrZtNye/uh4CMhfT7S7N1UzRq3R7n
"
}

# Create a web server
resource "aws_instance" "web" {
  ami = ami-08419d23bf91152e4
  instance_type ="t2.micro"
  key_name = "${aws_key_pair.aws_key_pair.key_name}"
  tags {  Name = web-server  }
  
}
