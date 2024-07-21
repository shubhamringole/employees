### How to Load the Sample Database `test_db` for MySQL

![image](https://github.com/user-attachments/assets/bf49ee56-9730-4ba5-afe5-f370dcf605b4)

In this guide, you'll learn step-by-step how to load the `test_db` sample database into MySQL. This database contains comprehensive data for testing purposes, including employee records and salary entries.

#### Prerequisites
Before starting, ensure you have the following:
1. A MySQL database server (version 5.0 or higher).
2. A user with the following privileges:
   - SELECT, INSERT, UPDATE, DELETE
   - CREATE, DROP, RELOAD, REFERENCES
   - INDEX, ALTER, SHOW DATABASES
   - CREATE TEMPORARY TABLES
   - LOCK TABLES, EXECUTE, CREATE VIEW

#### Step 1: Download the Repository
Begin by downloading the `test_db` repository from GitHub:
```sh
git clone https://github.com/datacharmer/test_db.git
```

#### Step 2: Change Directory to the Repository
Navigate to the downloaded repository:
```sh
cd test_db
```

#### Step 3: Install the Database
Load the database schema and data into MySQL:
```sh
mysql -u [username] -p < employees.sql
```
Replace `[username]` with your MySQL username. You'll be prompted to enter your MySQL password.

If you prefer to install with two large partitioned tables, run:
```sh
mysql -u [username] -p < employees_partitioned.sql
```

#### Step 4: Test the Installation
Verify the installation by running one of the test scripts:
```sh
mysql -u [username] -p -t < test_employees_md5.sql
```
or
```sh
mysql -u [username] -p -t < test_employees_sha.sql
```
This will output the result of the test, showing whether the expected number of records and checksums match the actual data in the tables.

Example output:
```
+----------------------+
| INFO                 |
+----------------------+
| TESTING INSTALLATION |
+----------------------+
+--------------+------------------+----------------------------------+
| table_name   | expected_records | expected_crc                     |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+------------------+----------------------------------+
| table_name   | found_records    | found_crc                        |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+---------------+-----------+
| table_name   | records_match | crc_match |
+--------------+---------------+-----------+
| employees    | OK            | ok        |
| departments  | OK            | ok        |
| dept_manager | OK            | ok        |
| dept_emp     | OK            | ok        |
| titles       | OK            | ok        |
| salaries     | OK            | ok        |
+--------------+---------------+-----------+
```

### Source and Origin
The original data was created by Fusheng Wang and Carlo Zaniolo at Siemens Corporate Research, stored in XML format. Giuseppe Maxia developed the relational schema, and Patrick Crews exported the data into a relational format. The database includes approximately 300,000 employee records and 2.8 million salary entries.

### Conclusion
Following these steps will help you successfully load and test the `test_db` database on your MySQL server. This database is ideal for testing applications and server configurations due to its realistic size and complexity.

### Disclaimer
To the best of my knowledge, this data is fabricated and does not correspond to real people. Any similarity to existing individuals is purely coincidental.
