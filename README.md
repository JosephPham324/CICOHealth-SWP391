# CICOHealth
## SWP391 (Software Development Project) project SP23
### This is a web application that allows user to watch their nutrition balance and energy consumption - exependiture.
### I. Run script to create database and insert starter data:
#### The script is written using Microsoft SQL Server 2019
#### Starter data includes:
1. Admin account with username "admin1USAD000001" and password "admin1USAD000001", along with its other information (can be changed like a normal user).
2. Some exercise types for the adding exercise feature.

### II. Source code adjustment and software requirements:
1. Rename setting in file DBContext.java, package Context:
   + user(sa) - username of account that has access to the database.
   + pass - password of account.
   + database name (in this script it is Nutrition).

2. This project is built and run by our team using
   + Server: Apache Tomcat 10
   + IDE: Apache Netbeans 13, 12.6
   + Environment: JDK 11
   + Driver: sqljdbc 4-3.0
   + Microsoft SQL Server Management Studio

### III. Running the project:
#### Starting the website:
We are learning students so we run the project with the help of Netbeans IDE. To run the project like we did, install Netbeans IDE and Apache Tomcat on your device and specify the server in Netbeans settings. 
To connect to the database we used port 1433 and sa account of MSSQLMS. You must create the database using the script and adjust the code in DBContext class for connection establishment.
##### Using the website:
The website UI is simple and open to intuition. User navigates using the header with pre-installed links, the links are either text or suggestive icons so users shouldn't have a hard time using our website.
