# WordPress + MySQL Local Setup Script

This script automates the setup of WordPress on a server with a self-hosted MySQL database.

## Features
- Updates system packages.
- Installs and configures MySQL, PHP, and Apache.
- Sets up WordPress with a self-hosted MySQL database.
- Installs and configures phpMyAdmin for database management.
- Outputs connection details for WordPress and phpMyAdmin.

## How to Use
1. **Download the Script**:
   - Save the script to your server with a `.sh` extension.

2. **Make the Script Executable**:
   - Run the following command to make the script executable:
     ```bash
     chmod +x <script_name>.sh
     ```

3. **Run the Script**:
   - Execute the script to set up WordPress:
     ```bash
     sudo ./<script_name>.sh
     ```

4. **Access WordPress**:
   - Once the script completes, access your WordPress installation using the server's public IP address.

5. **Access phpMyAdmin**:
   - Use the server's public IP address followed by `/phpmyadmin` to manage the database.

## Configuration Details
- **MySQL Root Password**: `StrongPassword123!`
- **Database Name**: `wordpress`
- **Database User**: `wp_user`
- **Database User Password**: `StrongPassword123!`
- **Installation Directory**: `/var/www/html`

## Prerequisites
- The script is designed for CentOS/RHEL-based systems.
- Ensure you have sudo privileges on the server.

## Notes
- The firewall is configured to allow HTTP and HTTPS traffic.
- Default MySQL credentials and database details can be modified by updating the script.

## Troubleshooting
- If the script fails, check the logs or error messages for details.
- Ensure the server has internet access for downloading required packages.

## Support
For questions or issues, please contact the script's author or your system administrator.

