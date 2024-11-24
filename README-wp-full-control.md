# On Instance Launch (Dynamic Path Version)

This README provides an updated script for automating the setup of WordPress and phpMyAdmin using the `wp-full-control.sh.x` script from your GitHub repository. The updated script dynamically determines the user's home directory, ensuring compatibility across different environments and Linux distributions.

## Script to Copy:
```bash
#!/bin/bash

# Determine the current user's home directory dynamically
HOME_DIR=$(eval echo "~$USER")

# Install Git
sudo yum install -y git

# Clone the GitHub repository
git clone https://github.com/Tradandan/cndan.git "$HOME_DIR/cndan"

# Navigate to the repository
cd "$HOME_DIR/cndan"

# Ensure the script is executable
chmod +x wp-full-control.sh.x

# Run the wp-full-control.sh.x script
./wp-full-control.sh.x
```

## What's New in This Version
1. **Dynamic Path**:
   - The script dynamically determines the home directory of the current user, making it compatible with multiple Linux distributions and different default users (e.g., `ec2-user`, `ubuntu`).
   
2. **Handles Existing Directory**:
   - You can add an optional check to remove the `cndan` directory if it already exists:
     ```bash
     if [ -d "$HOME_DIR/cndan" ]; then
         rm -rf "$HOME_DIR/cndan"
     fi
     ```

## How to Use
1. **Copy the Script**:
   - Copy the updated script above.

2. **Launch an EC2 Instance**:
   - Go to the AWS Management Console and launch a new EC2 instance.
   - Select an Amazon Linux 2 AMI (or another supported OS).
   - Configure instance details and expand the **Advanced Details** section.
   - Paste the script into the **User Data** field.

3. **Set Up Security Groups**:
   - Make sure your security group allows HTTP (port 80) and HTTPS (port 443) traffic.

4. **Launch and Verify**:
   - Start the instance and wait for it to initialize.
   - Check the system logs under **Monitor and Troubleshoot** > **Get System Log** to ensure the script executed successfully.

## Notes
- This script will install WordPress with a local MySQL database and phpMyAdmin.
- It is ideal for testing and development environments.
- For production use, ensure proper security configurations are applied to the instance and database.

