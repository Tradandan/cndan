## **Important: INFO VIA CLI ABOUT WP-FULL-CONTROL SCRIPT!**

### **Install Git on the AWS Instance**
Before running the script, ensure that Git is installed on your instance. Run the following command to install Git:
```bash
sudo yum install -y git   # For Amazon Linux
sudo apt update && sudo apt install -y git   # For Ubuntu
```

---

## **WordPress + MySQL Local Setup Script**

This script automates the setup of WordPress on a server with a self-hosted MySQL database and phpMyAdmin.

---

## **Features**
- Updates system packages for stability and security.
- Installs and configures:
  - **MySQL**: For local database management.
  - **PHP**: Ensures compatibility with WordPress.
  - **Apache**: Serves WordPress to the web.
  - **phpMyAdmin**: Simplifies database management.
- Automatically sets up WordPress with a self-hosted MySQL database.
- Outputs connection details for WordPress and phpMyAdmin for easy access.

---

## **How to Use**
### **Step 1: Clone the Repository**
1. Use Git to download the repository:
   ```bash
   git clone https://github.com/Tradandan/cndan.git
   cd cndan/Easy-WordPress-install
   ```

### **Step 2: Make the Script Executable**
1. Ensure the script is executable by running:
   ```bash
   chmod +x wp-full-control.sh.x
   ```

### **Step 3: Run the Script**
1. Execute the script to set up WordPress and phpMyAdmin:
   ```bash
   sudo ./wp-full-control.sh.x
   ```

### **Step 4: Access WordPress**
1. Once the script completes, access your WordPress installation using the server's public IP address:
   ```plaintext
   http://<your-ec2-public-ip>
   ```

### **Step 5: Access phpMyAdmin**
1. Use the server's public IP address followed by `/phpmyadmin` to manage the database:
   ```plaintext
   http://<your-ec2-public-ip>/phpmyadmin
   ```

---

### **Notes**
- Ensure your EC2 instance's security group allows inbound traffic on ports:
  - **80** (HTTP): For accessing WordPress and phpMyAdmin.
  - **443** (HTTPS): If you plan to secure your site with SSL.
- After completing the setup, it is recommended to:
  - Set strong database credentials.
  - Secure your WordPress installation with plugins or custom configurations.
  - Use SSL to encrypt connections.

---
