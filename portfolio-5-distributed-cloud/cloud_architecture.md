# Distributed & Cloud Architecture Specification

## Architecture Strategy for RichPay

### 1. High Availability & Master-Replica Replication
- **Primary Node (Read/Write)**: Processes all live balance updates and money transfers.
- **Read Replicas (Read-Only)**: Distributed across cloud regions to offload heavy read traffic (e.g., balance checking, account statement rendering).
- **Failover Mechanism**: Automatic multi-AZ (Availability Zone) failover promotes a secondary replica to Primary within seconds if hardware failure occurs.

### 2. Horizontal Scaling & Sharding
- **Sharding Key**: `customer_id`
- **Distribution Strategy**: Customer accounts and transaction histories are partitioned across database shards to ensure high throughput during peak traffic spikes.

### 3. Data Consistency & Backup Policies
- **CAP Theorem Trade-off**: Prioritizes **Consistency** and **Partition Tolerance** (CP) for financial ledgers, ensuring zero balance discrepancies.
- **Backup Plan**: Automated continuous WAL (Write-Ahead Logging) archiving with point-in-time recovery (PITR).
