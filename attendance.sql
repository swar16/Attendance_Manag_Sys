-- Creating the User table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    Password VARCHAR(50),
    Role VARCHAR(50)
);

-- Creating the Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    UserID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Class VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Creating the Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Teacher INT,
    FOREIGN KEY (Teacher) REFERENCES User(UserID)
);

-- Creating the Attendance table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Query to record attendance
INSERT INTO Attendance (StudentID, CourseID, Date, Status) VALUES (?, ?, ?, ?);

-- Query to view attendance
SELECT * FROM Attendance WHERE StudentID = ? AND CourseID = ?;

-- Query to generate attendance report for a course
SELECT * FROM Attendance WHERE CourseID = ?;

-- Query to create a user
INSERT INTO User (UserName, Password, Role) VALUES (?, ?, ?);

-- Query to update a user
UPDATE User SET UserName = ?, Password = ?, Role = ? WHERE UserID = ?;

-- Query to delete a user
DELETE FROM User WHERE UserID = ?;
