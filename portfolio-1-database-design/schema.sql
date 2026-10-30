-- Create Customers Table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20)
);

-- Create Accounts Table
CREATE TABLE Accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id) ON DELETE CASCADE,
    account_number VARCHAR(10) UNIQUE NOT NULL,
    balance DECIMAL(12, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Transactions Table
CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    sender_account_id INT REFERENCES Accounts(account_id),
    receiver_account_id INT REFERENCES Accounts(account_id),
    amount DECIMAL(12, 2) NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('Transfer', 'Deposit', 'Withdrawal')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
