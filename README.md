# Advanced E-Commerce Analytics & Customer Lifecycle Management

## 📊 Project Overview
This repository features an end-to-end database auditing portfolio simulating a normalized three-table e-commerce ecosystem (`Customers`, `Products`, and `Sales`) with **250,000+ transactional lines**. The analysis covers the entire data lifecycle—moving from relational architecture and high-velocity bulk ingestion to complex financial type-casting and customer cohort isolation.

## 🛠️ Tech Stack & Database Capabilities
* **Query Engine:** MySQL Workbench
* **Ingestion:** High-velocity loading via `LOAD DATA LOCAL INFILE` with server/client variable security configuration
* **Data Transformation:** Data type auditing (`CAST` explicitly to `DECIMAL(10,2)`) to handle string metrics mathematically
* **Analytics Framework:** Advanced partition windowing (`DENSE_RANK()`) and analytical boundary exclusions (`LEFT JOIN ... WHERE IS NULL`)

## 🔑 Key Business Use Cases Solved
1. **Level 1 & 2 (Target Optimization):** Isolated regional target markets and mapped out core geographic hub customer counts.
2. **Level 3 & 4 (Retention Analytics):** Tracked cancelled invoice leaks and calculated sequential user purchasing ranks to isolate VIP accounts without destroying granular data layers.
3. **Level 5 & 6 (Strategic BI & Churn):** Built multi-table relational matrices to identify revenue concentrations across membership tiers, and developed anti-churn logic to pinpoint friction in inactive customer cohorts.

## 📁 Repository Structure
* `/ecommerce_analytics_queries.sql`: Documented database script with production-ready code blocks.
* `/Yash_Sonawane_ECommerce_SQL_Portfolio.pdf`: Complete visual presentation deck outlining architectural logic and business analysis findings.
