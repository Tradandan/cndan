# **WordPress 3 Options Setup Script**
**ONLY in CLI - After Instance Launch**
This folder contains the `uni.sh.x` script, which provides **three different methods** for setting up WordPress. The flexibility of this script makes it ideal for experimenting with various configurations.

---

## **Features**

1. **Three Installation Options**:
   - **Option 1**: WordPress with a self-hosted MySQL database.
   - **Option 2**: WordPress configured to use an AWS RDS database.
   - **Option 3**: WordPress setup with the database configured during the first launch via the browser.

2. **Interactive Script**:
   - The script provides a simple, user-friendly menu to select your preferred setup option.

3. **Comprehensive Setup**:
   - Installs and configures Apache, PHP, and necessary dependencies.
   - Fully sets up WordPress based on your selected option.

---

## **How to Use**

1. **Clone the Repository**:
   - Ensure Git is installed, then clone the repository:
     ```bash
     sudo yum install -y git   # For Amazon Linux
     sudo apt update && sudo apt install -y git   # For Ubuntu
     git clone https://github.com/Tradandan/cndan.git ~/cndan
     ```

2. **Navigate to the Directory**:
   - Move to the `Wordpress-3-options` folder:
     ```bash
     cd ~/cndan/Wordpress-3-options
     ```

3. **Make the Script Executable**:
   - Ensure the script is executable:
     ```bash
     chmod +x uni.sh.x
     ```

4. **Run the Script**:
   - Start the setup by running:
     ```bash
     sudo ./uni.sh.x
     ```

5. **Follow the Prompts**:
   - Select your desired option and provide the necessary details when prompted.

---

## **Accessing Your WordPress Site**

- After the setup completes:
  - **Option 1 and Option 2**:
    - Access the site using the public IP of your EC2 instance:
      ```plaintext
      http://<your-ec2-public-ip>
      ```
    - For phpMyAdmin (if installed):
      ```plaintext
      http://<your-ec2-public-ip>/phpmyadmin
      ```

  - **Option 3**:
    - Complete the database configuration by visiting the WordPress setup page:
      ```plaintext
      http://<your-ec2-public-ip>/wordpress
      ```

---

## **Notes**

- The `uni.sh.x` script is designed to work with Amazon Linux, Ubuntu, and similar Linux distributions.
- For production use:
  - Secure your EC2 instance with proper security groups and firewall rules.
  - Ensure your AWS RDS database is configured with appropriate security measures.

---
