# Portfolio 3: Transactions and Concurrency

## Overview
This portfolio activity demonstrates ACID properties, transaction control mechanisms, and concurrency management within the RichPay banking database platform.

## Transaction Scenarios
1. **Successful Transfer (COMMIT)**: Demonstrates an atomic transaction transferring 5,000.00 from Account 1 to Account 2, deducting sender balance, updating receiver balance, and writing an audit log.
2. **Failed Transfer (ROLLBACK)**: Demonstrates data protection where a failed operation triggers a full rollback, ensuring no money is lost or wrongfully deducted.

## Concurrency & Isolation
- **Isolation Level**: Read Committed / Serializable levels prevent lost updates and uncommitted reads during simultaneous user access.
- **Atomicity**: Guarantees that all steps in a transfer succeed together or fail together.
