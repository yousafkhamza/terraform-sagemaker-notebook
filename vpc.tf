# -------------------------------------
# Default VPC fetchings
# -------------------------------------

data "aws_vpc" "default" {
    default = true
#   id = "vpc-04218dfaf2b5c7216"
} 
