# WordPress Database Credential Update Script

This script provides an interactive, user-friendly way to update the database credentials for your WordPress installation. It modifies the MySQL user settings and updates the `wp-config.php` file to reflect the new credentials. Follow the steps below to use this script effectively.

---

## **Prerequisites**
1. Ensure you have **sudo/root access** to the server where WordPress is installed.
2. Verify the **MySQL root password** is available.
3. Confirm the path to your WordPress installation's `wp-config.php` file (default is `/var/www/html/wp-config.php`).
4. Make a **backup** of your `wp-config.php` file before proceeding.

---

## **Script Overview**

### **Key Features**
- Logs messages using colored outputs for better readability:
  - **Info**: Blue
  - **Success**: Green
  - **Error**: Red
- Creates or updates MySQL database user credentials.
- Safely updates the `wp-config.php` file with new database credentials.

---

## **How to Use the Script**

1. **Save the Script**  
   Copy the following content into a file, for example, `update_wp_db.sh`.

   ```bash
   #!/bin/bash

   # Colors for output
   GREEN='\033[0;32m'
   RED='\033[0;31m'
   BLUE='\033[0;34m'
   NC='\033[0m'

   # Function to log messages
   log_info() {
       echo -e "${BLUE}[INFO]${NC} $1"
   }
   log_success() {
       echo -e "${GREEN}[SUCCESS]${NC} $1"
   }
   log_error() {
       echo -e "${RED}[ERROR]${NC} $1"
   }

   # Function to safely update the wp-config.php file
   update_wp_config() {
       local wp_config_path=$1
       local db_user=$2
       local db_password=$3

       if [[ -f "$wp_config_path" ]]; then
           log_info "Updating wp-config.php with new credentials..."
           sed -i "s/define('DB_USER', '.*');/define('DB_USER', '$db_user');/" "$wp_config_path"
           sed -i "s/define('DB_PASSWORD', '.*');/define('DB_PASSWORD', '$db_password');/" "$wp_config_path"
           log_success "wp-config.php updated successfully!"
       else
           log_error "wp-config.php not found at $wp_config_path. Ensure the file exists and try again."
           exit 1
       fi
   }

   # Start of the script
   log_info "Welcome to the WordPress Database Credential Update Script!"

   # Prompt for MySQL root password
   read -sp "Enter MySQL root password: " mysql_root_password
   echo ""

   # Prompt for the new database user and password
   read -p "Enter the new database username: " new_db_user
   read -sp "Enter the new database password: " new_db_password
   echo ""

   # Prompt for WordPress database name
   read -p "Enter the WordPress database name: " wp_db_name

   # Update database user and password in MySQL
   log_info "Updating database credentials in MySQL..."
   mysql -u root -p"$mysql_root_password" -e "CREATE USER IF NOT EXISTS '$new_db_user'@'localhost' IDENTIFIED BY '$new_db_password';"
   mysql -u root -p"$mysql_root_password" -e "GRANT ALL PRIVILEGES ON $wp_db_name.* TO '$new_db_user'@'localhost';"
   mysql -u root -p"$mysql_root_password" -e "FLUSH PRIVILEGES;"

   if [[ $? -eq 0 ]]; then
       log_success "Database credentials updated successfully in MySQL!"
   else
       log_error "Failed to update database credentials in MySQL. Please check your inputs and try again."
       exit 1
   fi

   # Locate wp-config.php
   default_wp_config_path="/var/www/html/wp-config.php"
   read -p "Enter the path to wp-config.php (default: $default_wp_config_path): " wp_config_path
   wp_config_path=${wp_config_path:-$default_wp_config_path}

   # Update wp-config.php with new credentials
   update_wp_config "$wp_config_path" "$new_db_user" "$new_db_password"

   # Final success message
   log_success "WordPress database credentials updated successfully!"
   log_info "Your WordPress installation is now configured with the new database user and password."
