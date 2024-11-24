
## **Important THIS IS INFO ONLY ABOUT THE SCRIPT!**
### **Install Git On the AWS-Instance**



# WordPress + MySQL Local Setup Script

This script automates the setup of WordPress on a server with a self-hosted MySQL database.

## Features
- Updates system packages.
- Installs and configures MySQL, PHP, and Apache.
- Sets up WordPress with a self-hosted MySQL database.
- Installs and configures phpMyAdmin for database management.
- Outputs connection details for WordPress and phpMyAdmin.

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
     chmod +x wp-full-control.sh.x
     ```

3. **Run the Script**:
   - Execute the script to set up WordPress and phpMyAdmin:
     ```bash
     sudo ./wp-full-control.sh.x
     ```

4. **Access WordPress**:
   - Once the script completes, access your WordPress installation using the server's public IP address.

5. **Access phpMyAdmin**:
   - Use the server's public IP address followed by `/phpmyadmin` to manage the database.

