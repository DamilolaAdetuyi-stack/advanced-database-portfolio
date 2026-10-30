**MIT 8103 Advanced Database Management Systems: Portfolio Final Documentation**

Student ID: 301871009

Project Title: RichPay Fintech Database Engine

Student Name: Damilola Adetuyi

GitHub Repository Link: https://github.com/DamilolaAdetuyi-stack/advanced-database-portfolio

**Executive Summary**

The RichPay Fintech Platform is an enterprise-grade database solution designed to support secure, scalable, and high-performance financial transactions. This portfolio documents the complete lifecycle of the platform's data engine across five core areas: relational database design and normalization, query optimization, transactional concurrency control, NoSQL document integration, and cloud-distributed database architecture.

**1. Relational Database Design and Normalization**

Overview

For the core platform, I designed a relational database schema for RichPay, a digital banking application that manages user profiles, financial accounts, and transaction records.


Schema & Entity Relationships
The relational schema consists of three core entities:


•	Customers: Stores user registration details, including full name, email, and contact details.

•	Accounts: Tracks individual bank accounts linked to customers, holding current balances and account creation timestamps.

•	Transactions: Logs money movements between accounts using dual foreign keys (sender_account_id and receiver_account_id).

Normalization
The database structure was designed from the ground up to satisfy 3rd Normal Form (3NF):


•	1NF: Column values are atomic (e.g., separating first_name and last_name).

•	2NF: All non-key attributes depend entirely on primary keys (customer_id, account_id, transaction_id).

•	3NF: Removed transitive dependencies so non-key attributes don't rely on other non-key columns.

Entity-Relationship Diagram (ERD)
Below is the ER diagram showing table structures, primary keys, foreign keys, and 1-to-many relationship flows:
<img width="662" height="212" alt="er_diagram" src="https://github.com/user-attachments/assets/9baacdd2-ad2a-4057-b35d-e96167bfc6ca" />







**2. Query Processing and Optimization**

Implementation & Testing Script To evaluate query execution behavior, I created queries.sql containing sample data and EXPLAIN ANALYZE commands:
EXPLAIN ANALYZE 
EXPLAIN ANALYZE 
SELECT * FROM Transactions WHERE sender_account_id = 1;
Execution Behavior & Optimization
•	Unindexed Query: Without an index, the database performs a Sequential Scan (Seq Scan), checking every row in Transactions.

•	Index Strategy: I added a B-Tree index on the foreign key column:
SQL     CREATE INDEX idx_transactions_sender ON Transactions(sender_account_id);

);
•	Optimized Execution: After indexing, EXPLAIN ANALYZE utilizes an Index Scan, lowering search complexity from $O(N)$ to $O(\log N)$.

SQL Script Reference Below is the committed queries.sql script containing data setup, indexing, and performance queries:
 

**3. Transaction Management and Concurrency Control**

ACID Integrity & Transfer Safety
Handling money requires strict atomic operations—a balance deduction and balance addition must succeed together or fail together. I wrote SQL scripts demonstrating COMMIT and ROLLBACK handling.


Implementation Scenarios
1.	Successful Transfer (COMMIT): Balance is safely deducted from Account 1, added to Account 2, and written to the audit log in a single transaction block.

2.	Failed Transfer (ROLLBACK): If an unexpected error or constraint violation occurs mid-transfer, executing ROLLBACK immediately reverses all changes, preserving account balances.

-- Transfer Example
BEGIN;
UPDATE Accounts SET balance = balance - 5000.00 WHERE account_id = 1;
UPDATE Accounts SET balance = balance + 5000.00 WHERE account_id = 2;
INSERT INTO Transactions (sender_account_id, receiver_account_id, amount, transaction_type)
VALUES (1, 2, 5000.00, 'Transfer');
COMMIT;
SQL     

**4. NoSQL Integration and Document Modeling**

Relational vs. NoSQL
While SQL tables handle core financial ledger balances, a NoSQL document database (like MongoDB) is better suited for unstructured logs, security telemetry, and fast activity feeds.


Document Implementation
I designed a JSON document schema (nosql_model.json) that embeds sender/receiver names, transaction amounts, and flexible device metadata (e.g., IP address, device type, fraud check flags).

Storing device metadata in a NoSQL document avoids cluttering SQL tables with dynamic columns that change frequently across mobile app updates.


**5. Distributed and Cloud Database Architecture**

High Availability & Replication
To keep the application running 24/7 without downtime:


•	Primary-Secondary Replication: The Primary node handles write queries (transfers), while secondary read replicas in different regions handle read traffic (balance checks and transaction histories).

•	Automated Failover: If the main node fails, a secondary replica is promoted automatically.

Horizontal Scaling (Sharding)
The database uses customer_id as a Sharding Key to split user records and transaction histories across independent database nodes, preventing hardware bottlenecks as user sign-ups grow.


**Conclusion**

This project covers the full lifecycle of a database engine for a fintech application. By combining 3NF relational design, query indexing, ACID-compliant transaction blocks, NoSQL document logging, and cloud replication strategies, the platform guarantees data integrity, quick search queries, and high availability.


**Declaration on the Use of Artificial Intelligence (AI)**

In accordance with academic and professional integrity guidelines, I declare the use of AI tools during the completion of this database portfolio:


•	Tool Used: Google Gemini (Large Language Model)

•	Scope of Assistance:


o	Assisting with drawing layout checks and relationship syntax for the Draw.io ER diagram.

o	Formatting Markdown files, SQL script templates (schema.sql, queries.sql, transactions.sql), and JSON schemas.

o	Structural formatting and proofreading of documentation.

•	My Contribution: All table attributes, schema constraints, project logic, repository commits, and final testing verification were reviewed, committed, and validated independently.


