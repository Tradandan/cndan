# Unified WordPress Setup Script (uni.sh.x)

Welcome! This README provides detailed instructions for using the `uni.sh.x` script, a unified tool to set up WordPress in three different ways on an EC2 instance. Follow the steps carefully to ensure a smooth setup.

---

## **About the Script**
The `uni.sh.x` script offers three setup options for WordPress:
1. **Option 1**: Install WordPress with an AWS RDS Database.
2. **Option 2**: Full Local Setup with phpMyAdmin and MySQL.
3. **Option 3**: Minimal Setup with WordPress files only (database configuration via browser).

The script ensures that all required software, services, and permissions are configured correctly for each option.

---

## **How to Use the Script**
Follow these steps to use the `uni.sh.x` script:

### **Step 1: Transfer the Script to Your EC2 Instance**
1. Connect to your EC2 instance using SSH:
   ```bash
   ssh -i "your-key.pem" ec2-user@<your-ec2-public-ip>
   ```
2. Transfer the `uni.sh.x` file to your EC2 instance using `scp`:
   ```bash
   scp -i "your-key.pem" uni.sh.x ec2-user@<your-ec2-public-ip>:~
   ```

### **Step 2: Make the Script Executable**
Once the script is on the EC2 instance, make it executable:
```bash
chmod +x uni.sh.x
```

### **Step 3: Run the Script**
Run the script to begin the setup process:
```bash
./uni.sh.x
```

---

## **Script Options and Steps**
After running the script, you will be prompted to choose one of the following options:

### **Option 1: Install with AWS RDS Database**
1. **Description**:
   - Sets up WordPress to use an AWS RDS database.
2. **Steps**:
   - Enter the required RDS details when prompted (e.g., database endpoint, username, password, etc.).
   - The script configures WordPress to connect to the RDS database.
3. **Result**:
   - WordPress is fully set up and ready to use with the RDS database.

---

### **Option 2: Full Local Setup (phpMyAdmin + MySQL)**
1. **Description**:
   - Installs MySQL locally and sets up phpMyAdmin for database management.
2. **Steps**:
   - The script automatically installs and configures MySQL and phpMyAdmin.
   - WordPress is set up to use the local MySQL database.
3. **Result**:
   - WordPress and phpMyAdmin are ready for use. Access phpMyAdmin via your EC2 public IP (e.g., `http://<your-ec2-public-ip>/phpmyadmin`).

---

### **Option 3: Minimal Setup (WordPress Only)**
1. **Description**:
   - Downloads and extracts WordPress files. Database configuration is completed manually via the WordPress setup wizard.
2. **Steps**:
   - The script downloads WordPress and places the files in `/var/www/html`.
   - Open your browser and navigate to the public IP of your EC2 instance (e.g., `http://<your-ec2-public-ip>`).
   - Complete the database configuration via the WordPress setup wizard.
3. **Result**:
   - WordPress files are ready, and the database is configured through the browser.

---

## **Prerequisites**
1. **Security Groups**:
   - Ensure your EC2 instance's security group allows inbound traffic on ports:
     - **80** (HTTP) for accessing WordPress.
     - **443** (HTTPS) if you plan to use SSL.
   - For Option 1 (RDS), ensure your database security group allows connections from the EC2 instance.

2. **IAM Role** (for Option 1):
   - Attach an IAM role to the EC2 instance with permissions to access the RDS database if required.

---

## **Common Commands for Troubleshooting**
1. **Restart Apache**:
   ```bash
   sudo systemctl restart httpd
   ```
2. **Check Apache Logs**:
   ```bash
   sudo tail -f /var/log/httpd/error_log
   ```
3. **Check MySQL Logs (Local Setup)**:
   ```bash
   sudo tail -f /var/log/mysqld.log
   ```

---

## **Additional Notes**
- The script dynamically determines the user's home directory, ensuring compatibility across multiple environments (e.g., `ec2-user`, `ubuntu`).
- Use this script for testing and development. For production use, secure your WordPress installation with proper permissions, SSL certificates, and firewall rules.

---

Enjoy your WordPress setup! If you encounter any issues, refer to the troubleshooting section or contact your administrator.
