# **ONLY After Instance Launch!**

Welcome! This README provides detailed instructions for using the `uni.sh.x` script from the GitHub repository, which offers a unified tool to set up WordPress in three different ways.

---

## **How to Use the Script from GitHub**
Follow these steps to use the `uni.sh.x` script:

### **Step 1: Clone the GitHub Repository**
1. Connect to your EC2 instance using SSH:
   ```bash
   ssh -i "your-key.pem" ec2-user@<your-ec2-public-ip>
   ```

2. Clone the GitHub repository containing the `uni.sh.x` script:
   ```bash
   git clone https://github.com/Tradandan/cndan.git ~/cndan
   ```

3. Navigate to the repository directory:
   ```bash
   cd ~/cndan
   ```

---

### **Step 2: Make the Script Executable**
Ensure the script is executable:
```bash
chmod +x uni.sh.x
```

---

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

## **How to Access Your WordPress Setup**
### **Frontend (WordPress Site)**
- For all options, the WordPress frontend can be accessed at:
  ```plaintext
  http://<your-ec2-public-ip>
  ```

### **Backend (WordPress Admin Panel)**
- After completing the WordPress setup, the admin panel can be accessed at:
  ```plaintext
  http://<your-ec2-public-ip>/wp-admin
  ```

### **Database Management**
1. **For Option 1 (AWS RDS Database)**:
   - Use a database client (e.g., MySQL Workbench) and connect using the RDS endpoint and credentials.

2. **For Option 2 (Local MySQL + phpMyAdmin)**:
   - Access phpMyAdmin via your browser:
     ```plaintext
     http://<your-ec2-public-ip>/phpmyadmin
     ```

3. **For Option 3 (Minimal Setup)**:
   - The database is configured through the WordPress setup wizard in your browser.

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

## **Troubleshooting**
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

Enjoy your WordPress setup! If you encounter any issues, refer to the troubleshooting section or contact your administrator.
