# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project demonstrates a complete data warehousing and analytics workflow, from building a data warehouse to generating actionable insights. It is developed as part of my learning journey in data engineering and analytics.

---
## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:
![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV files into a SQL Server database.
2. **Silver Layer**: This layer includes data cleaning, standardization, and transformation processes to prepare data for analysis.
3. **Gold Layer**: Contains business-ready data modeled into a star schema for reporting and analytics.

---
## 📖 Project Overview

This project includes:

1. **Data Architecture**: Designing a modern data warehouse using Medallion Architecture (**Bronze**, **Silver**, **Gold** layers).
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Creating fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Developing SQL-based reports to generate useful business insights.

🎯 This project demonstrates skills in:
- SQL Development
- Data Engineering  
- ETL Pipeline Development  
- Data Modeling  
- Data Analytics  

---

## 🛠️ Important Links & Tools:

- **[Datasets](datasets/):** Access to the project dataset (CSV files).
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Lightweight server for hosting the database.
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** Tool for managing and interacting with databases.
- **[Git Repository](https://github.com/):** Used for version control and project management.
- **[DrawIO](https://www.drawio.com/):** Used to design architecture and data flow diagrams.
- **[Notion](https://www.notion.com/):** Used for project planning and organization.
- **[Notion Project Steps](https://www.notion.so/Data-Warehouse-Project-32b288290f2380858fc5d3226ac07198):** View the complete project workflow and tasks.

---

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data and support analytical reporting.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Clean and resolve data quality issues before analysis.
- **Integration**: Combine both sources into a single, analysis-friendly data model.
- **Scope**: Focus on the latest dataset only; historization is not required.
- **Documentation**: Provide clear documentation for both technical and business understanding.

---

### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to generate insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights help support better decision-making.


---

## 📂 Repository Structure
