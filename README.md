# 🏗️ SQL Data Warehouse Project (Medallion Architecture)

## 📌 Project Overview
This project demonstrates the design and implementation of a **SQL Data Warehouse** using the **Medallion Architecture (Bronze → Silver → Gold layers)**.

The goal is to transform raw data into structured, high-quality datasets for analytics and business insights.

---

## 🏗️ Architecture
![Architecture](docs/data_architecture.png)

### 🔹 Data Flow
- **Bronze Layer** → Raw data ingestion  
- **Silver Layer** → Data cleaning & transformation  
- **Gold Layer** → Final analytical tables (fact & dimension)  

---

## 🎯 Objectives
- Build scalable data warehouse architecture  
- Perform ETL using SQL (T-SQL)  
- Design star schema (fact & dimension tables)  
- Enable analytical queries for business insights  

---

## 🛠️ Technologies Used
- **SQL Server (T-SQL)**  
- **Data Warehousing Concepts**  
- **ETL Pipelines**  
- **Star Schema Design**  

---

## 📂 Project Structure
```
SQL-Data-Warehouse/
│
├── scripts/
│   ├── init.sql
│   ├── ddl_bronze.sql
│   ├── proc_load_bronze.sql
│   ├── ddl_silver.sql
│   ├── proc_load_silver.sql
│   ├── ddl_gold.sql
│
├── docs/
│   └── data_architecture.png
```

---

## 🔄 ETL Workflow

### 1️⃣ Bronze Layer (Raw Data)
- Data is loaded from CSV files  
- Stored without transformation  

### 2️⃣ Silver Layer (Clean Data)
- Remove duplicates  
- Handle missing values  
- Standardize formats  

### 3️⃣ Gold Layer (Analytics)
- Create **dimension tables** (customers, products)  
- Create **fact table** (sales)  
- Enable fast analytical queries  

---

## ⭐ Key Features
- Medallion Architecture implementation  
- End-to-end ETL pipeline  
- Star schema modeling  
- Data quality checks  
- Analytical queries using SQL  

---

## 📊 Sample Analysis
- Total sales and revenue trends  
- Customer segmentation  
- Product category performance  
- Monthly sales analysis  

---

## 🚀 Project Impact
- Demonstrates real-world data engineering workflow  
- Converts raw data into business-ready insights  
- Improves query performance using structured schema  

---

## 👨‍💻 Author
**Uday Kumar Vadde**  
- GitHub: https://github.com/udaykumarvadde200  

---

## ⭐ If you like this project
Give it a ⭐ on GitHub!
