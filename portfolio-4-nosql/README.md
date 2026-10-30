# Portfolio 4: NoSQL and Advanced Data Models

## Overview
This activity demonstrates the integration of a NoSQL Document Model (JSON/MongoDB style) within the RichPay banking ecosystem to handle real-time activity logging, flexible device metadata, and audit tracking.

## Model Suitability
- **Flexibility**: Unlike relational tables, document models allow storing nested, variable metadata (e.g., device IP, app versions, dynamic anti-fraud flags) without altering relational database schemas.
- **High Throughput**: NoSQL document stores enable ultra-fast write operations for continuous transaction logging and real-time security telemetry.
- **Data Representation**: Embedded JSON document structure (`nosql_model.json`) showcases how sender, receiver, and security metadata are captured in a single document.
