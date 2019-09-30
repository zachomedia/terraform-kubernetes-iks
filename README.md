# Terraform for IBM Kubernetes Service

> **Please note that this module is currently under development.**

The overall flow for this module is pretty simple:

* Create IBM object storage account to store Terraform state
* Create IBM IKS configuration in a modular manner
* Deploy the infrastructure incrementally

## Security Controls

The following security controls can be met through configuration of this template:

* TBD

## Dependencies

* None

## Pre-requisites

* Your account must have VRF and Service Endpoints enabled. See the [support documentation](https://cloud.ibm.com/docs/account?topic=account-vrf-service-endpoint&locale=en-us) for more information.
* Terraform 0.11 or older (Terraform 0.12 is not yet supported by the IBM provider)
* [IBM Terraform Provider](https://github.com/IBM-Cloud/terraform-provider-ibm)

## Workflow

1. Create terraform.tfvars based on example template provider.

2. Generate HMAC credentials for your Object Storage account: https://cloud.ibm.com/docs/services/cloud-object-storage/iam?topic=cloud-object-storage-service-credentials#service-credential-endpoints

```sh
export AWS_ACCESS_KEY_ID=<access_key>
export AWS_SECRET_ACCESS_KEY=<secret>
```

3. Initialize and set the Terraform backend configuration parameters for the AzureRM provider.

```sh
terraform init \
  -backend-config="endpoint=s3.tor01.cloud-object-storage.appdomain.cloud" \
  -backend-config="region=tor01" \
  -backend-config="bucket=tfstate" \
  -backend-config="key=${prefix}-iks.tfstate"
```

(note, if you are using a region other than tor01, update the endpoint and region config)

4. Create an execution plan and save the generated plan to a file.

```sh
terraform plan -out plan
```

5. Apply the plan to deploy/update the cluster.

```sh
terraform plan -out plan
terraform apply plan
```

8. KubeConfig

```sh
ibmcloud ks cluster-config --cluster ${prefix}
```

## History

| Date     | Release    | Change      |
| -------- | ---------- | ----------- |
| 20190930 | 20190930.1 | 1st release |
