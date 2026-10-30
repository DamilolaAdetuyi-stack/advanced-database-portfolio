# Portfolio 2: Query Processing and Optimisation

## Overview
This activity demonstrates SQL query execution, performance evaluation using execution plans, and performance optimization using indexing on the RichPay database schema.

## Execution Analysis & Optimisation
1. **Sample Data Insertion**: Inserted initial records into `Customers`, `Accounts`, and `Transactions` tables to enable performance evaluation.
2. **Unindexed Query**: Running `EXPLAIN ANALYZE` on filtering `sender_account_id` results in a Sequential Scan (`Seq Scan`), scanning every row in the table.
3. **Indexing**: Created a B-Tree index `idx_transactions_sender` on `Transactions(sender_account_id)`.
4. **Optimized Query**: After indexing, the database uses an `Index Scan`, significantly reducing query costs and execution time for large datasets.
