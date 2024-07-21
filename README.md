Prerequisites
MySQL Server: Ensure you have MySQL server version 5.0 or above installed.
Privileges: The user running the commands must have the following privileges:
SELECT, INSERT, UPDATE, DELETE
CREATE, DROP, RELOAD, REFERENCES
INDEX, ALTER, SHOW DATABASES
CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW
Step-by-Step Installation
Step 1: Download the Repository
Download the test_db repository from its source. You can clone it using Git if you have Git installed:

bash
Copy code
git clone https://github.com/datacharmer/test_db.git
Alternatively, you can download the repository as a ZIP file from the GitHub page and extract it.

Step 2: Change Directory to the Repository
Navigate to the directory where the repository was downloaded:

bash
Copy code
cd test_db
Step 3: Load the Database
Option 1: Load Standard Database
To load the standard database, run the following command:

bash
Copy code
mysql -u [username] -p < employees.sql
Replace [username] with your MySQL username. You will be prompted to enter your MySQL password.

Option 2: Load Partitioned Database
If you prefer to load the database with two large partitioned tables, run the following command instead:

bash
Copy code
mysql -u [username] -p < employees_partitioned.sql
Step 4: Test the Installation
After loading the database, you can test the installation to ensure everything is set up correctly. Run one of the following test scripts:

bash
Copy code
mysql -u [username] -p -t < test_employees_md5.sql
or

bash
Copy code
mysql -u [username] -p -t < test_employees_sha.sql
Example Output
Here is what a successful test output might look like:

plaintext
Copy code
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
Notes
The test outputs show the number of records and CRC checks for each table, ensuring the data integrity and correctness.
If there are any discrepancies, they will be highlighted in the test output for further investigation.
By following these steps, you should be able to load and test the test_db sample database in your MySQL server successfully.
