## **Important!**
### **Install Git On the Instance**
If Git is not already installed, run:
```bash
sudo yum install -y git   # For Amazon Linux
sudo apt update && sudo apt install -y git   # For Ubuntu
```

# WordPress Setup Scripts

This repository contains two scripts for setting up WordPress:

1. **wp-rds.sh**: For setting up WordPress with an AWS RDS database. Ideal for learning about and using RDS.
2. **wp-full-control.sh.x**: For a full local setup of WordPress and phpMyAdmin on an EC2 instance using a self-hosted MySQL database. Perfect for quick testing or playing with WordPress.

## Features
- **Both Scripts**:
  - Automate the setup of WordPress.
  - Configure necessary software like Apache, PHP, and MySQL.
  - Provide easy-to-follow prompts and clear output.
  
- **wp-rds.sh**:
  - Connects WordPress to an AWS RDS database.
  - Ideal for practicing with cloud-hosted databases.

- **wp-full-control.sh**:
  - Sets up a local MySQL database and phpMyAdmin.
  - A fast, all-in-one solution for testing WordPress.

## How to Use
1. **Clone the Repository**:
   - Use Git to download the scripts:
     ```bash
     git clone https://github.com/Tradandan/cndan.git
     cd cndan
     ```

2. **Make the Script Executable**:
   - For both scripts, ensure they are executable by running:
     ```bash
     chmod +x wp-rds.sh wp-full-control.sh.x
     ```

3. **Run the Script**:
   - Choose one of the following options based on your setup needs:
     - **For WordPress with RDS (wp-rds.sh.x)**:
       ```bash
       ./wp-rds.sh.x
       ```
       Follow the interactive prompts to provide your RDS details.

     - **For Full Local Setup (wp-full-control.sh.x)**:
       ```bash
       sudo ./wp-full-control.sh.x
       ```

4. **Access WordPress**:
   - Once the script completes, access your WordPress installation using the server's public IP address.

5. **Access phpMyAdmin (wp-full-control.sh only)**:
   - Use the server's public IP address followed by `/phpmyadmin` to manage the database.

## Notes
- Ensure the EC2 instance has proper permissions and access to the internet.
- Security groups should allow HTTP, HTTPS, and database traffic as necessary.

## Troubleshooting
- Check error messages or logs if the script fails.
- Verify internet connectivity on the instance.

## Support
For any issues or questions, contact the repository owner.

