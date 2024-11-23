#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Output functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1"
}
log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1"
}
log_error() {
    echo -e "${RED}[ERROR]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Configuration
MYSQL_ROOT_PASSWORD="StrongPassword123!"
WP_DB_NAME="wordpress"
WP_DB_USER="wp_user"
WP_DB_PASSWORD="StrongPassword123!"
INSTALL_DIR="/var/www/html"

# Stage 1: System Preparation
log_info "Starting system preparation..."

# Update system packages
log_info "Updating system packages..."
sudo dnf update -y --allowerasing
if [ $? -eq 0 ]; then
    log_success "System updated"
else
    log_error "System update failed"
    exit 1
fi

# Import MySQL GPG key
log_info "Importing MySQL GPG Key..."
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

# Install MySQL
log_info "Installing MySQL..."
sudo dnf install -y --nogpgcheck https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install -y --nogpgcheck mysql-community-server

# Start MySQL
log_info "Starting MySQL..."
sudo systemctl start mysqld
sudo systemctl enable mysqld

# Install PHP
log_info "Installing PHP and modules..."
sudo dnf install -y php8.3 php8.3-mysqlnd php8.3-fpm php8.3-gd php-mbstring php-zip php-json

# Install Apache
log_info "Installing Apache..."
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# Configure Firewall
log_info "Configuring Firewall..."
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

log_success "System preparation completed"
log_info "Waiting 10 seconds before WordPress installation..."
sleep 10

# Stage 2: WordPress Installation
log_info "Starting WordPress installation..."

# Get MySQL temporary password
temp_password=$(sudo grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
if [ -z "$temp_password" ]; then
    log_error "Failed to get MySQL temp password"
    exit 1
fi

# Configure MySQL
log_info "Configuring MySQL..."
sudo mysql --connect-expired-password -u root -p"$temp_password" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
sudo mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE $WP_DB_NAME;"
sudo mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER '$WP_DB_USER'@'localhost' IDENTIFIED BY '$WP_DB_PASSWORD';"
sudo mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'localhost';"
sudo mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# Download WordPress
log_info "Downloading WordPress..."
cd $INSTALL_DIR
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo cp -r wordpress/* .
sudo rm -rf wordpress latest.tar.gz

# Configure WordPress
log_info "Configuring WordPress..."
sudo cp wp-config-sample.php wp-config.php
sudo sed -i "s/database_name_here/$WP_DB_NAME/" wp-config.php
sudo sed -i "s/username_here/$WP_DB_USER/" wp-config.php
sudo sed -i "s/password_here/$WP_DB_PASSWORD/" wp-config.php

# Set permissions
sudo chown -R apache:apache $INSTALL_DIR
sudo chmod -R 755 $INSTALL_DIR

log_success "WordPress installation completed"
log_info "Waiting 10 seconds before phpMyAdmin installation..."
sleep 10

# Stage 3: phpMyAdmin Installation
log_info "Starting phpMyAdmin installation..."

# Install dependencies
log_info "Installing dependencies..."
sudo dnf install -y wget unzip php-mbstring php-zip php-json php-gd php-mysqlnd

# Download phpMyAdmin
log_info "Downloading phpMyAdmin..."
cd $INSTALL_DIR
LATEST_VERSION=$(curl -s https://www.phpmyadmin.net/home_page/version.txt | head -1)
sudo wget "https://files.phpmyadmin.net/phpMyAdmin/${LATEST_VERSION}/phpMyAdmin-${LATEST_VERSION}-all-languages.zip"

# Extract phpMyAdmin
log_info "Extracting phpMyAdmin..."
sudo unzip "phpMyAdmin-${LATEST_VERSION}-all-languages.zip"
sudo mv "phpMyAdmin-${LATEST_VERSION}-all-languages" phpmyadmin
sudo rm -f "phpMyAdmin-${LATEST_VERSION}-all-languages.zip"

# Configure phpMyAdmin
log_info "Configuring phpMyAdmin..."
sudo cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
sudo sed -i "s/\['host'\] = 'localhost'/\['host'\] = '127.0.0.1'/" phpmyadmin/config.inc.php
sudo sed -i "s/\['AllowNoPassword'\] = false/\['AllowNoPassword'\] = true/" phpmyadmin/config.inc.php

# Set permissions
sudo chown -R apache:apache $INSTALL_DIR/phpmyadmin
sudo chmod -R 755 $INSTALL_DIR/phpmyadmin

# Restart Apache
sudo systemctl restart httpd

# Get server IP
SERVER_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 2>/dev/null || hostname -I | awk '{print $1}')

log_success "Installation completed successfully!"
echo "====================================="
echo "WordPress URL: http://$SERVER_IP"
echo "phpMyAdmin URL: http://$SERVER_IP/phpmyadmin"
echo "WordPress Database: $WP_DB_NAME"
echo "WordPress Database User: $WP_DB_USER"
echo "WordPress Database Password: $WP_DB_PASSWORD"
echo "MySQL Root Password: $MYSQL_ROOT_PASSWORD"
echo "====================================="
