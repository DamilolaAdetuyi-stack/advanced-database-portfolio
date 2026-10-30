-- Scenario 1: Successful Fund Transfer Transaction (COMMIT)
BEGIN;

-- 1. Deduct 5000.00 from Sender Account (Account ID: 1)
UPDATE Accounts 
SET balance = balance - 5000.00 
WHERE account_id = 1;

-- 2. Add 5000.00 to Receiver Account (Account ID: 2)
UPDATE Accounts 
SET balance = balance + 5000.00 
WHERE account_id = 2;

-- 3. Log the transaction details
INSERT INTO Transactions (sender_account_id, receiver_account_id, amount, transaction_type)
VALUES (1, 2, 5000.00, 'Transfer');

-- Save changes permanently
COMMIT;


-- Scenario 2: Failed Transfer / Safety Reversal (ROLLBACK)
BEGIN;

-- 1. Deduct 100000.00 from Sender Account (Account ID: 2)
UPDATE Accounts 
SET balance = balance - 100000.00 
WHERE account_id = 2;

-- 2. Simulate system failure or constraint check failure
-- (If error occurs, revert all operations to keep data safe)
ROLLBACK;
