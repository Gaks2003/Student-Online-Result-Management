-- Student Result Management System Database Initialization
-- This script creates the basic database structure

USE srms;

-- Create admin table
CREATE TABLE IF NOT EXISTS admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    updationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert default admin user
INSERT INTO admin (UserName, Password) VALUES
('admin', MD5('Test@123'));

-- Create tblclasses table
CREATE TABLE IF NOT EXISTS tblclasses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(80) NOT NULL,
    ClassNameNumeric INT NOT NULL,
    Section VARCHAR(5) NOT NULL,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create tblsubjects table
CREATE TABLE IF NOT EXISTS tblsubjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    SubjectName VARCHAR(100) NOT NULL,
    SubjectCode VARCHAR(10) NOT NULL,
    Creationdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create tblsubjectcombination table
CREATE TABLE IF NOT EXISTS tblsubjectcombination (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ClassId INT NOT NULL,
    SubjectId INT NOT NULL,
    status INT DEFAULT 1,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ClassId) REFERENCES tblclasses(id),
    FOREIGN KEY (SubjectId) REFERENCES tblsubjects(id)
);

-- Create tblstudents table
CREATE TABLE IF NOT EXISTS tblstudents (
    StudentId INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100) NOT NULL,
    RollId VARCHAR(100) NOT NULL,
    StudentEmail VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    DOB DATE NOT NULL,
    ClassId INT NOT NULL,
    RegDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Status INT DEFAULT 1,
    FOREIGN KEY (ClassId) REFERENCES tblclasses(id)
);

-- Create tblresult table
CREATE TABLE IF NOT EXISTS tblresult (
    id INT PRIMARY KEY AUTO_INCREMENT,
    StudentId INT NOT NULL,
    ClassId INT NOT NULL,
    SubjectId INT NOT NULL,
    marks INT NOT NULL,
    PostingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentId) REFERENCES tblstudents(StudentId),
    FOREIGN KEY (ClassId) REFERENCES tblclasses(id),
    FOREIGN KEY (SubjectId) REFERENCES tblsubjects(id)
);

-- Create indexes for better performance
CREATE INDEX idx_students_class ON tblstudents(ClassId);
CREATE INDEX idx_students_email ON tblstudents(StudentEmail);
CREATE INDEX idx_result_student ON tblresult(StudentId);
CREATE INDEX idx_result_class ON tblresult(ClassId);
CREATE INDEX idx_subject_combination ON tblsubjectcombination(ClassId, SubjectId);