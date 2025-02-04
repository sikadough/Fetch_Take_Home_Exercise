# Fetch_Take_Home_Exercise



This repository contains my solution to the Fetch Rewards Coding Exercise for the Analytics Engineer role. The exercise involves:

Designing a structured relational data model from unstructured JSON data.

Writing SQL queries to answer specific business questions.

Identifying data quality issues in the provided dataset.

Communicating findings to stakeholders.

The solution is implemented using Microsoft SQL Server (MS SQL) and assumes the dataset spans several years.

fetch-exercise/
README.md                       # This file
Final ER Diagram.pdf            # Diagram of the structured relational data model
SQL Queries.sql                 # SQL queries for business questions
Data Quality Checks.sql         # SQL queries for data quality checks
Email Communication.pdf         # Email/Slack message to stakeholders



####Data Model Design
The data model consists of four tables:

Users: Stores information about users who scan receipts.

Receipts: Stores information about receipts scanned by users.

ReceiptItems: Stores information about individual items on a receipt.

Brands: Stores information about brands associated with items on receipts.

Relationships
Users → Receipts: One-to-Many (One user can have many receipts).

Receipts → ReceiptItems: One-to-Many (One receipt can have many items).

ReceiptItems → Brands: Many-to-One (Many items can belong to one brand).

A visual diagram of the data model can be found in Fianl ER Diagram.pdf

#######***********SQL Dialect***********########
The SQL queries are written for Microsoft SQL Server (MS SQL).

####SQL Queries
The SQL queries are located in SQL Queries.sql. They answer the following business questions:

Top 5 Brands by Receipts Scanned for the Most Recent Month.

Average Spend for Receipts with 'Accepted' or 'Rejected' Status.

Total Number of Items Purchased for 'Accepted' or 'Rejected' Receipts.

Brand with the Most Spend Among Users Created in the Past 6 Months.

Brand with the Most Transactions Among Users Created in the Past 6 Months.




####Data Quality Checks
The SQL queries for data quality checks are located in Data Quality Checks.sql. They identify the following issues:

Missing Data: Null values in critical fields like userId, dateScanned, and totalSpent.

Inconsistent Data: Invalid values in rewardsReceiptStatus.

Duplicate Records: Duplicate entries in Receipts, Users, and Brands.

Referential Integrity: Orphaned records in Receipts and ReceiptItems.




####Communication with Stakeholders
A sample email/Slack message to stakeholders is provided in Email Communication.md. It includes:

Key data quality issues discovered.

Questions for clarification.

Recommendations for resolving issues and optimizing data assets.


This README.md provides a comprehensive overview of the project, making it easy for reviewers to understand your work and navigate the repository. Let me know if you need further adjustments!
