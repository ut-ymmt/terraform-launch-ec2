module "ec2" {
  source = "../../modules/ec2"

  base_ami = "ami-xxxx"
  key_pair = "hoge-key"
  subnet   = "subnet-xxxx"
  security_groups = [
    "hoge",
    "fuga"
  ]

  tags_owner = "ut-ymmt"
  tags_name  = "helloworld"
}
