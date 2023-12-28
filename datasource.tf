
#-----datasource to find ami details-----#

data "aws_ami" "recent" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["${var.project_name}-${var.project_env}-*"]
  }

  filter {
    name   = "tag:project"
    values = ["${var.project_name}"]
  } 

  filter {
    name   = "tag:env"
    values = ["${var.project_env}"]
  } 
}


#-----datasource to find hosted_zone details-----#

data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}
