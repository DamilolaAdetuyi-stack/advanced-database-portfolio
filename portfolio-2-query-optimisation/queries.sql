-- 1. Insert Sample Data for Testing
INSERT INTO Customers (first_name, last_name, email, phone_number) 
VALUES ('Shotayo', 'David', 'amina@example.com', '09035345672'),
       ('Quadri', 'Suffianu', 'david@example.com', '08037654320');

INSERT INTO Accounts (customer_id, account_number, balance) 
VALUES (1, '0146456797', 150000.00),
       (2, '7876543209', 75000.00);

INSERT INTO Transactions (sender_account_id, receiver_account_id, amount, transaction_type) 
VALUES (1, 2, 25000.00, 'Transfer');

-- 2. Basic Query: Fetch all transactions for a specific sender account
EXPLAIN ANALYZE 
SELECT * FROM Transactions WHERE sender_account_id = 1;

-- 3. Optimization: Create an Index to speed up transaction searches
CREATE INDEX idx_transactions_sender ON Transactions(sender_account_id);

-- 4. Optimized Query execution check
EXPLAIN ANALYZE 
SELECT * FROM Transactions WHERE sender_account_id = 1;
