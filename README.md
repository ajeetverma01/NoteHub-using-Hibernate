# Note Taker Web Application using Hibernate

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

### Prerequisites

* JDK 8+
* Apache Tomcat 8.5+
* MySQL
* Maven 

## Author

**Ajeet Verma**
