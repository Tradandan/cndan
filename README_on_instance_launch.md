# On Instance Launch

This README provides a script that can be used as user data during an EC2 instance launch. The script automates the installation of WordPress and phpMyAdmin using the `wp-full-control.sh.x` script from your GitHub repository.

## Script to Copy:
```bash
#!/bin/bash
# Install Git
sudo yum install -y git

# Clone the GitHub repository
git clone https://github.com/Tradandan/cndan.git /home/ec2-user/cndan

# Navigate to the repository
cd /home/ec2-user/cndan

# Ensure the script is executable
chmod +x wp-full-control.sh.x

# Run the wp-full-control.sh.x script
./wp-full-control.sh.x
```

## How to Use
1. **Copy the Script**:
   - Copy the script above.

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
