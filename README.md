# Data Deduplication System

Java · JSP · Servlets · Apache Tomcat 7 · MySQL

A Java web application that demonstrates secure file storage with data deduplication, role-based workflows, key-controlled access, and download monitoring. The system stores a file once, records its metadata and keys in MySQL, and manages requests from owners, users, administrators, proxy servers, and simulated malicious users.

## Overview

Duplicate file storage increases database and cloud-storage cost. This project models a data-deduplication workflow in which uploaded files are identified by a file ID, stored with access keys, and made available to approved users through controlled download flows.

The application is implemented as a traditional Java web application: JSP pages provide the user interface, Servlets handle requests, and MySQL stores user, owner, key-request, upload, and monitoring data. It runs locally on Apache Tomcat 7.

## Architecture

```text
Browser
   |
   v
JSP pages (WebContent/)
   |
   v
Java Servlets (src/com/servlets/)
   |
   v
Database helper and JavaBeans
   |
   v
MySQL: datadeduplication-2024
```

## Features

- User and data-owner registration and login workflows
- File upload and duplicate-file storage records
- File IDs and two-part key-based download access
- User key requests and owner approval flow
- File search, file listing, and download pages
- Download-count tracking and attack-record tracking
- Administrative, proxy-server, and malicious-user demonstration roles
- JSP-based interface with Java Servlet request handling

## Roles

| Role | Main responsibility |
| --- | --- |
| Data Owner | Uploads files, reviews access requests, and shares keys. |
| User | Registers, requests access keys, searches, and downloads authorized files. |
| Data Manager / Admin | Reviews registered users and manages project data. |
| Proxy Server | Demonstration role for proxy-server login and file-access flows. |
| Malicious User | Demonstration role used to record attempted unauthorized access. |

## Repository Structure

```text
Data-depulication-2024/
├── src/
│   ├── Algorithm/                 # Deduplication-related helper logic
│   ├── com/beans/                 # JavaBeans for users, owners, keys, and attacks
│   ├── com/dao/                   # Data-access objects
│   ├── com/DBConnect/             # MySQL database helper
│   └── com/servlets/              # Servlet endpoints
├── WebContent/
│   ├── WEB-INF/
│   │   ├── lib/                   # MySQL Connector/J, Gson, Servlet/JSP APIs
│   │   └── web.xml                # Web application configuration
│   ├── asset/                     # CSS, JavaScript, fonts, and images
│   └── *.jsp                      # Application pages
├── .project                       # Eclipse project metadata
├── .classpath                     # Eclipse classpath metadata
└── README.md
```

## Requirements

- JDK 8
- Apache Tomcat 7
- MySQL 5.5 or a compatible MySQL server
- Eclipse IDE for Enterprise Java or VS Code with Java extensions

## Local Setup

1. Import the database schema and sample data from the provided `Data deduplication.sql` file. This database export is intentionally excluded from Git for safety.
2. Create a local MySQL database named `datadeduplication-2024`.
3. Copy `src/com/DBConnect/Dataduplicate/DbConnection.java.example` to `DbConnection.java`.
4. In `DbConnection.java`, set your own local MySQL username and password. Never commit your real password.
5. Configure Tomcat 7 in Eclipse, or deploy `WebContent` and compiled classes to a Tomcat installation.
6. Start Tomcat and open:

```text
http://localhost:8084/Data-depulication-2024/
```

## Database Tables

The application uses these main tables:

| Table | Purpose |
| --- | --- |
| `user` | Registered users and their approval/login state. |
| `owner` | Data-owner account information. |
| `upload` / `upload1` | File metadata, contents, and access keys. |
| `ukeys` | Keys shared with authorized users. |
| `keyreq` | Pending and approved file-key requests. |
| `fcount` | Per-user download-count data. |
| `attack` | Recorded unauthorized-access attempts. |

## Run Locally

With Tomcat configured as a Windows service:

```powershell
Start-Process "http://localhost:8084/Data-depulication-2024/"
```

Or start the configured Tomcat server from Eclipse and run the project on the Tomcat 7 server.

## Security Notes

This is an academic/demo project and is intended for local use. Before any production use, improve password handling, replace SQL string concatenation with parameterized queries everywhere, add input validation and authorization checks, use HTTPS, and move configuration/secrets out of source code.

## Limitations

- The project is a local demonstration, not a production cloud-storage platform.
- It uses a legacy Java/JSP/Tomcat stack for academic-project compatibility.
- The data-deduplication workflow is represented through database records and access-key flows; it is not a distributed storage engine.
- No public deployment URL is provided; the project runs on local Tomcat.

## Future Improvements

- Replace legacy JSP scriptlets with MVC controllers and template views
- Upgrade to a supported Java, Tomcat, and MySQL version
- Add password hashing and role-based authorization middleware
- Add automated tests and a GitHub Actions workflow
- Add file hashing for stronger duplicate detection
- Containerize the application with Docker Compose

## Interview Explanation

> I built a Java web application that demonstrates data deduplication and controlled file sharing. JSP pages provide the interface, Servlets process user actions, and MySQL stores users, owners, file records, access keys, key requests, download counts, and simulated attack records. A data owner uploads a file, users request access, the owner approves the request, and the authorized user can download the file using the required keys. The project also tracks download activity and records unauthorized access attempts. It is designed as a local academic demonstration and runs on Apache Tomcat 7 with Java 8 and MySQL.

## License

This repository is provided for educational and portfolio purposes.
