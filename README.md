# Data Deduplication System

Java · JSP · Servlets · Apache Tomcat 7 · MySQL

A Java web application that demonstrates secure file storage through data deduplication, controlled key sharing, role-based workflows, and download monitoring.

## Features

- Data-owner and user registration/login
- File upload with duplicate-file detection
- File ID generation and two-part access keys
- Search, key-request, owner approval, and controlled download flow
- Download-attempt and unauthorized-access monitoring
- Data Manager, Proxy Server, and Malicious User demonstration roles
- Admin monitoring pages for stored files, users, owners, and attack records

## Technology Used

- Java 8
- JSP and Java Servlets
- Apache Tomcat 7
- MySQL 5.5+ / compatible MySQL server
- HTML, CSS, JavaScript, Bootstrap

## Run Locally

### 1. Create the database

The repository includes a safe empty schema. It contains no real accounts, passwords, or uploaded files.

From the project folder, run:

```powershell
mysql -u root -p < database/demo-schema.sql
```

### 2. Configure database access

Copy:

```text
src/com/DBConnect/Dataduplicate/DbConnection.java.example
```

to:

```text
src/com/DBConnect/Dataduplicate/DbConnection.java
```

Then set your own local MySQL username and password in `DbConnection.java`. Do not commit this file.

### 3. Deploy and start

Configure the project in Eclipse with Tomcat 7, or deploy `WebContent` and compiled classes to Tomcat.

Open:

```text
http://localhost:8084/Data-depulication-2024/
```

If Tomcat and MySQL are installed as Windows services, run `START-AND-CHECK.ps1` as Administrator to start and verify the project.

## Demonstration Flow

1. Register and log in as a Data Owner.
2. Upload a small sample text file from `DEMO-FILES`.
3. Register and log in as a User.
4. Search for the uploaded file and request the access keys.
5. Log in as the Data Owner, approve the request, and share the keys.
6. Log in again as the User and download with the file ID and keys.
7. Use the monitoring roles to view download attempts and attack records.

## Repository Structure

```text
src/                 Java Servlets, JavaBeans, DAO, and database helper
WebContent/          JSP pages, front-end assets, and Tomcat configuration
database/            Safe empty MySQL demo schema
DEMO-FILES/          Sample files and walkthrough for demonstrations
START-AND-CHECK.ps1  Local service/startup verification script
```

## Important Notes

- This is an academic/local demonstration project, not a production cloud-storage platform.
- GitHub Pages displays the project documentation only; the full JSP application requires local Tomcat and MySQL.
- Use dummy accounts and sample files only.
- Before production use, add password hashing, parameterized queries, stronger authorization checks, HTTPS, modern dependency versions, and automated tests.

## License

Provided for educational and portfolio purposes.
