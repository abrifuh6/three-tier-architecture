# ByteWave Technologies Infrastructure

This Terraform configuration sets up the infrastructure for ByteWave Technologies on AWS. It includes the following components:

- Virtual Private Cloud (VPC)
- Internet Gateway
- Public Subnets
- Private Subnets
- Database Subnets
- Route Tables
- NAT Gateway
- Elastic Load Balancers (Internet-facing and Internal)

## Prerequisites

Before applying this Terraform configuration, make sure you have the following:

### AWS Account and Credentials

- An AWS account with appropriate permissions to create and manage VPCs, subnets, route tables, Internet Gateways, NAT Gateways, and Elastic Load Balancers.

- AWS CLI installed and configured with your AWS account credentials. You can configure AWS CLI using the `aws configure` command.

- Terraform installed on your local machine. You can download Terraform from the official website: [Terraform Downloads](https://www.terraform.io/downloads.html).

## Configuration

1. **Update AWS Region**: Open the `main.tf` file and update the `provider` block to specify your desired AWS region. For example, change `"us-east-1"` to the AWS region of your choice:

   ```hcl
   provider "aws" {
     region = "us-east-1" # Change this to your desired AWS region
   }

*Customize Resources*: Customize the resource configurations in main.tf to match your specific infrastructure requirements. You can modify variables, instance types, subnet CIDR blocks, and other parameters as needed. Be sure to review and adapt the entire Terraform configuration according to your needs.
Usage
Follow these steps to deploy the infrastructure:

Initialize Terraform: In your terminal, navigate to the directory containing your Terraform files and run the following command to initialize Terraform:

`terraform init`
Create Execution Plan: Run the following command to create a Terraform execution plan and review the changes that will be made:

`terraform plan`
This step will provide you with a summary of the resources that will be created, modified, or deleted.

Apply Terraform Configuration: Apply the Terraform configuration to create the infrastructure. Run the following command:

`terraform apply`

When prompted, enter yes to confirm and apply the changes.

Review and Monitor: After the Terraform configuration has been applied successfully, review the AWS Management Console to ensure that the resources have been created as expected. Monitor the infrastructure to verify its stability.

 **- Cleanup**

To destroy the infrastructure and clean up resources when they are no longer needed:

Destroy Resources: Run the following command to destroy the resources created by Terraform:

`terraform destroy`

Review the proposed changes, and when prompted, enter yes to destroy the resources.

Double-check: After destruction, double-check the AWS Management Console to ensure that all resources have been terminated.

**- Important Notes**

The Internet-facing Elastic Load Balancer (ELB) is associated with the public subnets to distribute incoming traffic to instances that require public access.

The Internal ELB is associated with the private subnets to manage internal application traffic within the VPC.

Route tables are configured to route traffic to the Internet Gateway for resources in public subnets and to the NAT Gateway for resources in private subnets, enabling Internet access for instances in public subnets and secure outbound access for instances in private subnets.

For additional configuration options and customization, please refer to the official Terraform documentation for the AWS Provider.

Please ensure that you understand the changes this Terraform configuration will make to your AWS environment before applying it.
