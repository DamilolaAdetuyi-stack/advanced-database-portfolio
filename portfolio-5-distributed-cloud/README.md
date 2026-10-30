# Portfolio 5: Distributed and Cloud Database Exercise

## Overview
This activity details the cloud infrastructure, high availability strategies, replication models, and distributed database scaling designed for the RichPay fintech platform.

## Key Highlights
- **Replication Strategy**: Uses Primary-Secondary replication to segregate write-heavy transaction processing from read-heavy reporting queries.
- **Sharding Strategy**: Partitioned by `customer_id` for horizontal scalability across cloud nodes.
- **Resilience & Backup**: Multi-region failover and point-in-time recovery guarantee 99.99% system availability and financial data integrity.
