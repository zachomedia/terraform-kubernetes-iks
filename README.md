# Terraform for IBM IKS

## Getting started

### Pre-requisites

1. Terraform 0.11 (The IBM provider does not yet Terraform 0.12)
1. [IBM Terraform Provider](https://github.com/IBM-Cloud/terraform-provider-ibm)
1. An IBM Object Storage account

### Initialize

Generate HMAC credentials for your Object Storage account: https://cloud.ibm.com/docs/services/cloud-object-storage/iam?topic=cloud-object-storage-service-credentials#service-credential-endpoints

```sh
export AWS_ACCESS_KEY_ID=<access_key>
export AWS_SECRET_ACCESS_KEY=<secret>
```

```sh
terraform init \
  -backend-config="endpoint=s3.tor01.cloud-object-storage.appdomain.cloud" \
  -backend-config="region=tor01" \
  -backend-config="bucket=tfstate" \
  -backend-config="key=cluster.tfstate"
```

*Note, replace all values with those appropriate for your environment.*

### Configure

```sh
cp terraform.tfvars.example terraform.tfvars
```

## Plan

```sh
terraform plan -out plan
```

## Apply

```sh
terraform apply plan
```
