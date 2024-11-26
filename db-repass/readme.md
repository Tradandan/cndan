# Secure WordPress Database Update Script (`sec.sh.x`)

This script is a secure and user-friendly way to update database credentials for a WordPress installation. It works by updating the MySQL user settings and automatically modifying the `wp-config.php` file with the new database credentials.

---

## Features
- **Interactive Prompts**: Easy-to-follow input prompts.
- **MySQL Configuration**: Creates and grants privileges to a new database user.
- **WordPress Configuration**: Automatically updates `wp-config.php`.
- **Error Handling**: Provides clear feedback and exits safely on errors.

---

## Requirements
1. **Linux-Based System**: Compatible with most Linux distributions.
2. **MySQL Installed**: A running MySQL server.
3. **WordPress Installation**: Access to the `wp-config.php` file.
4. **Root Access**: Permissions to make system and database changes.

---

## Installation

### Clone the Repository
Clone the repository to your local machine:
```bash
git clone https://github.com/Tradandan/cndan.git
cd cndan/db-repass
```

### Make the Script Executable
Grant execution permissions to the script:
```bash
chmod +x sec.sh.x
```

---

## Usage

### Running the Script
Run the script with the following command:
```bash
./sec.sh.x
```

### Follow the Interactive Prompts
1. Enter your **MySQL root password** when prompted.
2. Provide the **new database username** and **password**.
3. Enter the **WordPress database name**.
4. Confirm or modify the path to `wp-config.php` (default: `/var/www/html/wp-config.php`).

---

## Example Interaction
```plaintext
Welcome to the WordPress Database Credential Update Script!
Enter MySQL root password: ********
Enter the new database username: wp_user
Enter the new database password: ********
Enter the WordPress database name: wordpress_db
Enter the path to wp-config.php (default: /var/www/html/wp-config.php):
```

Upon successful completion, the script will:
- Update the MySQL database user and password.
- Modify the `wp-config.php` file with the new credentials.

---

## Troubleshooting

### Common Issues
1. **MySQL Connection Errors**:
   - Ensure MySQL is running and the root password is correct.
   - Use `systemctl status mysql` to check the MySQL service status.

2. **`wp-config.php` Not Found**:
   - Confirm the WordPress installation directory.
   - Verify that `wp-config.php` exists at the specified path.

### Logs and Debugging
- **Blue Logs (`[INFO]`)**: General information.
- **Green Logs (`[SUCCESS]`)**: Successful actions.
- **Red Logs (`[ERROR]`)**: Errors requiring attention.

---

## Best Practices
1. **Backup Your Files**: Always back up `wp-config.php` and database data before running this script.
2. **Use Secure Passwords**: For both the MySQL root user and new database user credentials.
3. **Run in a Safe Environment**: Avoid running on a public server without additional security measures.

---

## Contributions
Contributions are welcome! Feel free to fork this repository, submit issues, or create pull requests.  
Visit the repository: [GitHub - Tradandan/cndan](https://github.com/Tradandan/cndan/blob/main/db-repass/sec.sh.x)

---

Enjoy secure and effortless WordPress database updates!
