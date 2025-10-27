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

## 📋 Prerequisites

Before you begin, ensure you have met the following requirements:

- PHP 7.0 or higher
- MySQL 5.6 or higher
- Web server (Apache/Nginx)
- Composer (optional, for dependency management)

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/student-result-management.git
   cd student-result-management
   ```

2. **Setup Database**
   - Create a new MySQL database named `srms`
   - Import the database schema (if available) or run the SQL setup script

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
   - Open your browser and go to `http://localhost/your-project-folder`
   - Login with admin credentials

## 📁 Project Structure

```
student-result-management/
├── css/                    # Compiled CSS files
├── js/                     # JavaScript files
├── fonts/                  # Font files
├── images/                 # Image assets
├── sass/                   # SASS source files
├── includes/               # PHP includes and configuration
│   ├── config.php         # Database configuration
│   └── ...                # Other include files
├── db/                     # Database related files
├── dompdf/                 # PDF generation library
├── *.php                   # Main PHP application files
├── package.json           # Node.js dependencies for build tools
├── gulpfile.babel.js      # Gulp build configuration
└── README.md              # This file
```

## 🔧 Build Process (Optional)

This project includes Gulp for asset optimization:

1. **Install Node.js dependencies**
   ```bash
   npm install
   ```

2. **Run build process**
   ```bash
   gulp
   ```

3. **Watch for changes during development**
   ```bash
   gulp watch
   ```

## 👤 Default Admin Credentials

- **Username**: admin
- **Password**: Test@123

⚠️ **Important**: Change the default password after first login for security.

## 📖 Usage

### Managing Students
1. Go to "Manage Students" section
2. Click "Add Student" to register new students
3. Edit student information as needed
4. View student list and details

### Managing Classes
1. Navigate to "Manage Classes"
2. Create new classes with appropriate details
3. Edit class information when necessary

### Managing Subjects
1. Access "Manage Subjects" section
2. Add subjects with proper codes and names
3. Create subject combinations for different classes

### Managing Results
1. Go to "Manage Results" to add student results
2. Enter marks for each subject
3. Edit results when corrections are needed
4. Use "Find Results" to search specific student results

### Viewing and Downloading Results
1. Students can search their results using the search form
2. Download results in PDF format for record keeping

## 🔒 Security Features

- Password hashing with MD5
- Session-based authentication
- SQL injection prevention with PDO
- Input validation and sanitization

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](../../issues) page
2. Create a new issue with detailed description
3. Provide error logs and steps to reproduce

## 🔄 Updates and Maintenance

- Regularly backup your database
- Keep PHP and MySQL updated
- Monitor application logs
- Update dependencies regularly

## 📸 Screenshots

(Add screenshots of your application here to showcase the interface)

## 🙏 Acknowledgments

- Bootstrap for the responsive framework
- Font Awesome for icons
- DomPDF for PDF generation
- jQuery for enhanced functionality

---

**Note**: This system is designed for educational institutions to manage student results efficiently. Ensure proper security measures are in place when deploying to production.
