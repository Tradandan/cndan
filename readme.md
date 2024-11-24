# **WordPress Installation Automation Scripts**

Welcome to the **WordPress Installation Automation Repository**. This repository contains scripts to set up WordPress in different configurations, from local MySQL databases to AWS RDS and customizable options. Each folder is dedicated to a specific setup type, with detailed README files for step-by-step guidance.

---

## **Folders Overview**

### 1. **Easy-WordPress-install**
   - **Purpose**: Automates the installation of WordPress with a self-hosted MySQL database.
   - **Features**:
     - Installs Apache, PHP, and MySQL locally.
     - Configures WordPress for immediate use.
     - Includes phpMyAdmin for database management.
   - **Key Script**: `wp-full-control.sh.x`
   - **Read More**: [Easy WordPress Install Guide](./Easy-WordPress-install/README-wp-full-control.md)

---

### 2. **WordPress-with-RDS-AWS**
   - **Purpose**: Automates the installation of WordPress configured to use an AWS RDS database.
   - **Features**:
     - Prompts for AWS RDS database details during setup.
     - Installs Apache, PHP, and WordPress.
     - Configures WordPress to connect seamlessly with the RDS instance.
   - **Key Script**: `wp-rds.sh.x`
   - **Read More**: [WordPress with RDS Guide](./WordPress-with-RDS-AWS/README_wp_rds.md)

---

### 3. **WordPress-3-options**
   - **Purpose**: Provides three customizable installation options:
     1. WordPress with a self-hosted MySQL database.
     2. WordPress with an AWS RDS database.
     3. WordPress with database configuration on first launch via the browser.
   - **Features**:
     - Interactive menu to choose the desired setup.
     - Flexible for testing different configurations.
   - **Key Script**: `uni.sh.x`
   - **Read More**: [WordPress 3 Options Guide](./Wordpress-3-options/README-uni.sh.x.md)

---

## **Getting Started**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Tradandan/cndan.git ~/cndan
   cd ~/cndan
   ```

2. **Navigate to Your Desired Folder**:
   - `Easy-WordPress-install`
   - `WordPress-with-RDS-AWS`
   - `WordPress-3-options`

3. **Follow the Specific Instructions**:
   - Each folder includes a dedicated README file with step-by-step guidance.

---

## **Notes**

- These scripts are designed for development and testing purposes.
- For production use:
  - Secure your EC2 instance and database configurations.
  - Ensure the proper setup of AWS security groups.

---
