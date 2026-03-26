# 🚀 SQL Data Warehouse Project (Medallion Architecture)

## 📌 Overview

This project demonstrates the design and implementation of a **scalable data warehouse** using the **Medallion Architecture (Bronze, Silver, Gold layers)**.

The pipeline extracts raw data, performs transformations, and delivers **business-ready analytics datasets**.

---

## 🏗️ Architecture

![Architecture](docs/data_architecture.png)

```text
Source Data → Bronze → Silver → Gold → Analytics
```

* **Bronze Layer** → Raw data ingestion (no transformation)
* **Silver Layer** → Data cleaning, validation, and transformation
* **Gold Layer** → Business-ready data (Fact & Dimension tables)

---

## 🛠️ Tech Stack

* SQL Server (Data Warehouse)
* T-SQL (ETL & Transformations)
* Medallion Architecture
* Data Modeling (Star Schema)

---

## ⚙️ Key Features

* ✅ Layered data pipeline (Bronze → Silver → Gold)
* ✅ Bulk data ingestion using SQL procedures
* ✅ Data cleaning & transformation logic
* ✅ Star schema design (Fact & Dimension tables)
* ✅ Data quality checks for validation
* ✅ Modular and scalable SQL scripts

---

## 📂 Project Structure

```text
Sql-Data-Warehouse-Project1/
│
├── datasets/          # Source data files
├── docs/              # Architecture diagrams
├── scripts/
│   ├── Bronze/        # Raw data ingestion
│   ├── silver/        # Cleaning & transformation
│   ├── gold/          # Analytics layer
│   ├── init.sql
│   ├── proc_load_bronze.sql
│
├── tests/             # Data quality checks
└── README.md
```

---

## 🔄 Execution Flow

Run scripts in the following order:

```text
1. init.sql
2. ddl_bronze.sql
3. proc_load_bronze.sql
4. ddl_silver.sql
5. proc_load_silver.sql
6. ddl_gold.sql
7. Data Quality Checks
```

---

## 📊 Data Modeling

* Implemented **Star Schema**

  * Fact Tables → Sales data
  * Dimension Tables → Customer, Product

---

## 📊 Sample Output

```sql
SELECT * FROM gold.fact_sales;
```

| order_number | customer_key | product_key | sales_amount |
| ------------ | ------------ | ----------- | ------------ |
| 1001         | 1            | 10          | 5000         |

---

## 📈 Business Use Case

This warehouse enables:

* Sales performance analysis
* Customer insights
* Product-level analytics
* Reporting & dashboard integration

---

## 🧪 Data Quality Validation

The project includes SQL-based quality checks to ensure:

* No duplicate or null keys
* Valid date ranges
* Consistent business logic (sales = quantity × price)
* Clean and standardized data

---

## ⚠️ Setup Note

Update file paths in `proc_load_bronze.sql` before execution:

```sql
-- Replace with your local dataset path
SET @base_path = 'your_project_path\datasets\';
```

---

## 🧠 Key Learnings

* Designing scalable data pipelines
* Implementing Medallion Architecture
* Writing modular ETL scripts in SQL
* Data modeling using star schema
* Ensuring data quality and validation

---

## 🚀 Future Improvements

* Add incremental loading
* Automate pipeline (Airflow / ADF)
* Integrate BI dashboards (Power BI)
* Optimize query performance

---

## 📜 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

Uday Kumar
