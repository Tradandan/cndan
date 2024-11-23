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
   - Once the script completes, access your WordPress site via the public IP of your EC2 instance.


## **Important!**
### **Install Git On the Instance**
If Git is not already installed, run:
```bash
sudo yum install -y git   # For Amazon Linux
sudo apt update && sudo apt install -y git   # For Ubuntu
```

