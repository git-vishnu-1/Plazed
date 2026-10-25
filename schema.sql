CREATE TABLE users(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email_id VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('officer','student')
);

CREATE TABLE student_profile(
    user_id INT PRIMARY KEY,
    phone BIGINT,
    cgpa DECIMAL(4,2),
    backlogs INT,
    branch char(5),
    resume_path VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE drives(
    drive_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    company VARCHAR(100),
    drive_date DATE,
    status ENUM('upcoming','ongoing','completed') DEFAULT 'upcoming',
    pre_requisites TEXT,
    min_cgpa DECIMAL(4,2),
    max_backlog INT,
    allowed_branches VARCHAR(255)
);

CREATE TABLE officer(
    officer_id INT PRIMARY KEY,
    phone BIGINT,
    FOREIGN KEY (officer_id) REFERENCES users(user_id)
);

CREATE TABLE drive_attendance (
    student_id INT,
    drive_id INT,
    status ENUM('registered','attended','selected') DEFAULT 'registered',
    PRIMARY KEY (student_id, drive_id),
    FOREIGN KEY (student_id) REFERENCES users(user_id),
    FOREIGN KEY (drive_id) REFERENCES drives(drive_id)
);