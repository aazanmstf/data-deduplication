# Data Deduplication: Run and Test Checklist

## Start the project

1. Open **Windows PowerShell as Administrator**.
2. Run this command:

```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force
& "C:\Users\aazan\OneDrive\Desktop\Mini project\MINI PROJECT\MJBC04\CODE\Data-depulication-2024\START-AND-CHECK.ps1"
```

Success means the script says that MySQL, Tomcat, and the home page are working, then opens this address:

`http://localhost:8084/Data-depulication-2024/`

## Test the main workflow

Use a small text file such as `test-file.txt`. Do not use personal files.

| Check | What to do | Expected result |
| --- | --- | --- |
| Home page | Open the project URL. | Page loads without an error or blank screen. |
| Data-owner account | Choose **Data Manager → Register**, then log in. | Registration/login completes and the owner pages open. |
| Upload | Upload `test-file.txt` from the owner flow. | A success message and a file ID/key information are shown. |
| Duplicate detection | Upload the **same** file again. | The project identifies or handles the duplicate instead of treating it as a new independent file. |
| User account | Choose **User → Register**, then log in. | User registration/login completes. |
| Search | Use **Search Data** to find the uploaded file. | The uploaded file appears in the results. |
| Key request | Request access to that file as the user. | The request appears in the owner key/share page. |
| Owner approval | Log in as the data owner; open **Key Share** and approve the request. | The user is approved and can obtain the required keys. |
| Download | Log back in as the user; open **Download Data** and use the valid file ID/keys. | The original file downloads successfully. |
| Invalid-key protection | Try a deliberately incorrect key. | The download must be refused or an error shown. |
| Monitoring roles | Open the Proxy Server and Malicious User login pages. | Pages load; do not use real credentials or attack real systems. |

## If a check fails

- If the start script says **Access denied**, close it and reopen PowerShell as Administrator.
- If it says the web page did not return HTTP 200, open `C:\Tomcat7\logs\catalina.out` and send me the newest error lines.
- If MySQL is running but a login, upload, or search fails, send me a screenshot of that page. Do not send passwords.

## Important

This is a local academic project. Test only with dummy accounts and dummy files. The project is not designed for public or production use.
