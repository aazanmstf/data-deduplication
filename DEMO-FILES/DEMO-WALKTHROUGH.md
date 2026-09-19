# Data Deduplication: Demo Guide

The `DEMO-FILES` folder contains safe files with no personal data. Use them when presenting the project.

## Demo accounts

Create these accounts from the website. If they already exist, add a number to the email address.

| Role | Email | Password | Age | Gender |
| --- | --- | --- | --- | --- |
| Data Owner | `demo.owner@example.com` | `DemoPass123!` | 25 | male |
| User | `demo.user@example.com` | `DemoPass123!` | 24 | female |

## Show the project in this order

1. Start the project with `START-AND-CHECK.ps1` and open the local website.
2. Register the Data Owner, then log in using **Data Manager → Login**.
3. Choose **Upload Data** and upload `demo-research-notes.txt`. Description: `Safe sample file for project demonstration`.
4. Upload `demo-research-notes.txt` again. Expected result: **File Name Is Duplicate**.
5. Upload `demo-research-notes-copy.txt`. Its name is different but its data is identical. Expected result: **File Data Content Is Duplicate**.
6. Upload `demo-inventory-report.csv`. Expected result: successful upload, because its content is different.
7. Register the Demo User under **User → Register**.
8. Open `http://localhost:8084/Data-depulication-2024/UserDetails.jsp`, find the new user, and click **Approve Request**.
9. Log in as the Demo User. Choose **Search Data**, search `demo-research-notes`, then click **Request**.
10. Return to the owner view. Open `http://localhost:8084/Data-depulication-2024/akey.jsp` and approve the key request.
11. Open `http://localhost:8084/Data-depulication-2024/okey.jsp` and click **Share Keys** for the Demo User.
12. Return to the user view. Choose **Download Data**. Show that an incorrect key does not work, then use the correct file ID and generated keys to download the file.

## What to say

“This Java JSP and Servlet project stores file details in MySQL. It detects duplicate filenames and duplicate content, so repeated data does not have to be stored again. A user must register, receive manager approval, request a file key, and receive the owner’s approval before downloading. The project also includes download monitoring and local, simulated proxy-server and malicious-user roles.”

## Simulation-only roles

| Screen | Username | Password |
| --- | --- | --- |
| Proxy Server | `proxyserver` | `proxyserver` |
| Malicious User | `attacker` | `attacker` |

Use these only inside this local academic project. Do not use personal files, passwords, or real systems.
