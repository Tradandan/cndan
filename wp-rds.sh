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

# Prompt for RDS details
log_info "Starting WordPress setup with RDS integration..."
read -p "Enter RDS Endpoint: " RDS_ENDPOINT
read -p "Enter RDS Port (default 3306): " RDS_PORT
RDS_PORT=${RDS_PORT:-3306}
read -p "Enter RDS Database Name: " WP_DB_NAME
read -p "Enter RDS Database Username: " WP_DB_USER
read -sp "Enter RDS Database Password: " WP_DB_PASSWORD
echo

# Configuration
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
sudo sed -i "s/localhost/$RDS_ENDPOINT/" wp-config.php
sudo sed -i "/DB_HOST/a define('DB_PORT', $RDS_PORT);" wp-config.php

# Set permissions
sudo chown -R apache:apache $INSTALL_DIR
sudo chmod -R 755 $INSTALL_DIR

log_success "WordPress installation completed"

# Get server IP
SERVER_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 2>/dev/null || hostname -I | awk '{print $1}')

log_success "Installation completed successfully!"
echo "====================================="
echo "WordPress URL: http://$SERVER_IP"
echo "WordPress Database: $WP_DB_NAME"
echo "WordPress Database User: $WP_DB_USER"
echo "WordPress Database Password: $WP_DB_PASSWORD"
echo "RDS Endpoint: $RDS_ENDPOINT"
echo "RDS Port: $RDS_PORT"
echo "====================================="
