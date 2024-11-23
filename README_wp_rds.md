# WordPress + RDS Setup Script

This repository contains `wp-rds.sh`, a script to automate the setup of WordPress on an EC2 instance using an AWS RDS database.

## Features
- Interactive prompts for RDS database details.
- Installs necessary software (Apache, PHP, etc.).
- Configures WordPress to connect to an AWS RDS database.
- Summarizes installation details for quick reference.

## How to Use
1. **Clone the Repository**:
   - Use Git to download the script:
     ```bash
     git clone https://github.com/Tradandan/cndan.git
     cd cndan
     ```

2. **Make the Script Executable**:
   - Ensure the script is executable by running:
     ```bash
     chmod +x wp-rds.sh
     ```

3. **Run the Script**:
   - Execute the script and follow the interactive prompts to provide your RDS details:
     ```bash
     ./wp-rds.sh
     ```

4. **Access WordPress**:
   - After the script completes, access your WordPress site via the public IP of your EC2 instance.

## Prerequisites
- An AWS EC2 instance with internet access.
- A properly configured AWS RDS instance.
- Ensure the EC2 instance has access to the RDS database (update security groups if needed).

## Notes
- You must provide the RDS endpoint, port, database name, username, and password during the setup process.
- Ensure the EC2 instance has sufficient permissions and access to install required software.

## Troubleshooting
- If the script fails, check for missing dependencies or network restrictions.
- Review logs or error messages to identify and resolve issues.

## Support
For questions or issues, feel free to contact the repository owner.

