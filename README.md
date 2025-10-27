# Student Result Management System

A comprehensive web-based application for managing student results, built with PHP and MySQL. This system provides administrators with tools to manage students, classes, subjects, and results efficiently.

## 🚀 Features

- **Student Management**: Add, edit, and manage student information
- **Class Management**: Create and organize classes
- **Subject Management**: Add and manage subjects with combinations
- **Result Management**: Record, edit, and view student results
- **Result Search**: Find results by student details
- **Download Results**: Export results in PDF format
- **User Authentication**: Secure admin login system
- **Responsive Design**: Works on desktop and mobile devices
- **Modern UI**: Clean and intuitive user interface

## 🛠️ Technology Stack

- **Backend**: PHP 7+
- **Database**: MySQL
- **Frontend**: HTML5, CSS3, JavaScript
- **Framework**: Bootstrap 4
- **PDF Generation**: DomPDF
- **Build Tools**: Gulp, SASS
- **Icons**: Font Awesome
- **Containerization**: Docker & Docker Compose
- **CI/CD**: GitHub Actions

## 🚀 Quick Start with Docker

### Prerequisites
- Docker and Docker Compose installed on your system

### Local Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Gaks2003/Student-Online-Result-Management.git
   cd Student-Online-Result-Management
   ```

2. **Start the application with Docker**
   ```bash
   docker-compose up -d
   ```

3. **Access the application**
   - Web Application: http://localhost:8080
   - phpMyAdmin: http://localhost:8081 (optional)
   - MySQL: localhost:3306

4. **Stop the application**
   ```bash
   docker-compose down
   ```

### Docker Services

- **app**: PHP 8.1 with Apache web server
- **mysql**: MySQL 8.0 database with sample data
- **phpmyadmin**: Database management interface (optional)
- **redis**: Caching service (optional)

## 🔄 CI/CD Pipeline

This project includes a comprehensive GitHub Actions workflow that automates:

### Automated Testing
- **PHP Syntax Check**: Validates all PHP files for syntax errors
- **Code Quality**: PHP CodeSniffer with PSR-12 standards
- **Security Audit**: Composer security vulnerability scanning
- **Unit Testing**: PHPUnit integration (when tests are available)

### Build Process
- **Asset Compilation**: Gulp build process for CSS/JS optimization
- **Dependency Management**: Composer and NPM package installation
- **Database Setup**: MySQL service with health checks

### Deployment
- **Artifact Creation**: Clean deployment packages
- **Automated Deployment**: Ready for server deployment
- **Post-deployment Verification**: Health checks and validation

### Workflow Triggers
- **Push Events**: Runs on pushes to master/main branch
- **Pull Requests**: Runs on PRs to master/main branch
- **Manual Dispatch**: Can be triggered manually

To view pipeline status, go to the **Actions** tab in your GitHub repository.

## 📋 Manual Installation (Alternative)

Before you begin, ensure you have met the following requirements:

- PHP 7.0 or higher
- MySQL 5.6 or higher
- Web server (Apache/Nginx)
- Composer (optional, for dependency management)

### Manual Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Gaks2003/Student-Online-Result-Management.git
   cd Student-Online-Result-Management
   ```

2. **Setup Database**
   - Create a new MySQL database named `srms`
   - Import the database schema from `db/init/01-init.sql`

3. **Configure Database Connection**
   - Open `includes/config.php`
   - Update database credentials if necessary:
   ```php
   define('DB_HOST','localhost');
   define('DB_USER','your_db_username');
   define('DB_PASS','your_db_password');
   define('DB_NAME','srms');
   ```

4. **Upload Files**
   - Upload all files to your web server
   - Ensure the web server has write permissions on necessary directories

5. **Access the Application**
   - Open your browser and go to your web server URL
   - Login with admin credentials

## 🚀 Deployment

### Option 1: Docker Deployment

For production deployment with Docker:

```bash
# Build and run with production settings
docker-compose -f docker-compose.yml up -d

# Or build custom image
docker build -t srms-app .
docker run -d -p 80:80 --name srms-container srms-app
```

### Option 2: Traditional Web Server Deployment

1. **Upload files to web server**
2. **Set up virtual host configuration**
3. **Configure database connection**
4. **Set proper file permissions**
5. **Configure SSL (recommended)**

### Option 3: Cloud Deployment

The GitHub Actions workflow includes deployment templates for:
- **AWS**: Elastic Beanstalk, EC2, Lightsail
- **DigitalOcean**: App Platform, Droplets
- **Heroku**: PHP applications
- **Azure**: App Service
- **Google Cloud**: App Engine, Compute Engine

## 🧪 Development

### Adding Tests

To add unit tests to the project:

1. Create a `tests/` directory
2. Add PHPUnit configuration: `phpunit.xml`
3. Install PHPUnit: `composer require --dev phpunit/phpunit`
4. Add test files: `tests/Feature/ExampleTest.php`

### Code Quality

The CI pipeline includes:
- **PHP CodeSniffer**: PSR-12 compliance
- **PHPStan**: Static analysis
- **Security scanning**: Composer audit

### Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes and test them
4. Run the CI pipeline locally: `docker-compose up --build`
5. Submit a pull request

## 📊 Monitoring

### Health Checks

The application includes health check endpoints:
- **Application Health**: `/health.php` (if implemented)
- **Database Connectivity**: Automatic PDO connection testing

### Logs

- **Application Logs**: Check web server logs
- **Database Logs**: MySQL error logs
- **Docker Logs**: `docker-compose logs -f`

## 🔒 Security

### Best Practices
- **Change default admin password** after installation
- **Use HTTPS** in production
- **Regular backups** of database and files
- **Keep dependencies updated**
- **Monitor security advisories**

### Environment Variables

For enhanced security, consider using environment variables:
```bash
DB_HOST=localhost
DB_USER=srms_user
DB_PASS=secure_password
DB_NAME=srms
```

## 📝 API Documentation

*(Add API documentation here if the application exposes REST APIs)*

## 🤝 Support

- **Issues**: Report bugs via GitHub Issues
- **Discussions**: Use GitHub Discussions for questions
- **Contributing**: See CONTRIBUTING.md for guidelines

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Bootstrap for the responsive framework
- Font Awesome for icons
- DomPDF for PDF generation
- Docker for containerization
- GitHub Actions for CI/CD automation

---

**Note**: This system is designed for educational institutions. Always ensure proper security measures are in place when deploying to production environments.
