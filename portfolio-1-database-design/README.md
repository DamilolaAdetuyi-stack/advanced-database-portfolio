# Portfolio 1: Database Design and Modelling

## Case Study: RichPay Fintech
RichPay is a digital banking platform designed to facilitate user registration, bank account management, deposits, withdrawals, and direct peer-to-peer transfers.

## Entity-Relationship (ER) Architecture
- **Customers**: Primary entity storing personal information and contact details.
- **Accounts**: Stores financial accounts linked directly to customers via `customer_id`.
- **Transactions**: Maintains transaction logs linking sender and receiver accounts (`sender_account_id`, `receiver_account_id`).

## Normalization Details
The relational schema adheres to **3rd Normal Form (3NF)**:
- **1NF**: All fields hold atomic (indivisible) values.
- **2NF**: Every non-key attribute is fully dependent on its primary key (`customer_id`, `account_id`, `transaction_id`).
- **3NF**: No transitive functional dependencies exist across non-key columns.
