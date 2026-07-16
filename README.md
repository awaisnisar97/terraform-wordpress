# Terraform AWS WordPress Deployment

An automated infrastructure-as-code (IaC) project designed to provision and bootstrap a standalone WordPress web server on AWS. This project uses Terraform to deploy secure network access rules and provisions an Amazon EC2 instance that automatically installs and configures Apache, PHP, and WordPress upon boot.

---

## Architecture Overview

This project automatically spins up the following resources in AWS:

*   **EC2 Instance (`t2.micro`)**: Running the modern **Amazon Linux 2023** AMI.
*   **Security Group (`wordpress-sg`)**:
    *   **Inbound (Ingress)**: Allows HTTP (Port 80) and SSH (Port 22) traffic from anywhere (`0.0.0.0/0`).
    *   **Outbound (Egress)**: Allows all traffic (`0.0.0.0/0`) so the server can fetch software packages and system updates.
*   **User Data (Cloud-Init)**: A system configuration script (`cloud-init.yaml`) that runs on the first boot to install and configure the entire web stack.

---

## File Structure

├── .gitignore             # Tells Git to ignore sensitive files (.tfstate, .tfvars)
├── cloud-init.yaml        # Bootstrapping script for Amazon Linux 2023
├── ec2.tf                 # Defines the EC2 instance and user_data association
├── main.tf                # Core Terraform resources (e.g., local variables, key-pairs)
├── outputs.tf             # Outputs key data like the public IP address
├── provider.tf            # Configures the AWS provider and region
├── sg.tf                  # Defines the security group and port access rules
├── terraform.tfvars       # (Ignored) Local variables for custom settings
└── variables.tf           # Declarations for input variables


<img width="1080" height="579" alt="Screenshot 2026-07-16 at 17 04 34" src="https://github.com/user-attachments/assets/06b7a980-e0ae-43da-a682-3e5654918300" />

<img width="1582" height="579" alt="Screenshot 2026-07-16 at 17 04 48" src="https://github.com/user-attachments/assets/2e4dd74f-c437-4f49-9ead-0cf37a109032" />

<img width="1582" height="781" alt="Screenshot 2026-07-16 at 17 05 03" src="https://github.com/user-attachments/assets/0a129467-81c7-420c-aa89-7364be47182b" />
