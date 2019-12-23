# terraform lounch ec2
A template for instantly launching ec2 using terraform.

## terraform varsions
- v0.12

## Usage

1. Prepare the environment

```bash
cd envs
mkdir helloworld
cp sample/* helloworld/
cd helloworld
terraform init
```

2. Edit file

- main.tf
- provider.tf
- [backend.tf(Option)](https://www.terraform.io/docs/backends/types/s3.html)

3. Create ec2

```bash
terraform plan
terraform apply
```
