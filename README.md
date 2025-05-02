# Note Taker Web Application 

A simple web-based note-taking application built using Java, Servlets, JSP, and Hibernate. This application allows users to create, update, delete, and view notes. Hibernate is used for ORM and MySQL is used as the database.

## Features

* Create a new note
* Update existing notes
* Delete notes
* View all saved notes

## Technologies Used

* Java
* Servlets & JSP
* Hibernate (ORM)
* MySQL
* HTML, CSS (basic styling)
* Apache Tomcat (v8.5)

## Folder Structure

```
├── src/main/java
│   └── com
│       └── servlets
│           ├── saveNoteServlet.java
│           ├── UpdateServlet.java
│           └── DeleteServlet.java
│       └── entities
│           └── Note.java
│       └── helper
│           └── FactoryProvider.java
├── WebContent
│   ├── all_notes.jsp
│   ├── add_note.jsp
│   └── index.jsp
├── WEB-INF
│   ├── web.xml
│   └── lib
│       └── (Hibernate & MySQL jars)
```

## Getting Started

### Prerequisites

* JDK 8+
* Apache Tomcat 8.5+
* MySQL
* Maven (if using Maven project)

### Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/note-taker-app.git
   cd note-taker-app
   ```

2. **Configure Database:**

   * Create a database named `notetaker` in MySQL.
   * Use the following table schema:

     ```sql
     CREATE TABLE Note (
         id INT PRIMARY KEY AUTO_INCREMENT,
         title VARCHAR(255),
         content TEXT,
         addedDate DATETIME
     );
     ```

3. **Configure Hibernate:**

   * Edit `hibernate.cfg.xml` with your MySQL credentials and DB name.

4. **Deploy on Tomcat:**

   * Build and deploy the WAR file to Tomcat.
   * Start the Tomcat server.


## Screenshots

(Add screenshots of your UI here)


## Author

**Ajeet Verma**
