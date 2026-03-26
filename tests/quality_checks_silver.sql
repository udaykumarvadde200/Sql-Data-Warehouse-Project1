/*
===============================================================================
Quality Checks for Silver Layer
===============================================================================
Description:
    This script validates data quality in the Silver layer to ensure consistency,
    accuracy, and standardization before building the Gold layer.

    Checks included:
    - NULL or duplicate business keys
    - Unwanted leading/trailing spaces
    - Invalid numeric values
    - Invalid date ranges and date order
    - Data consistency across related columns
===============================================================================
*/

-- ====================================================================
-- Check: silver.crm_cust_info
-- ====================================================================

-- Check for NULLs or duplicates in customer ID
-- Expectation: No results
SELECT 
    cst_id,
    COUNT(*) AS record_count
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for unwanted spaces in customer key
-- Expectation: No results
SELECT 
    cst_key
FROM silver.crm_cust_info
WHERE cst_key <> TRIM(cst_key);

-- Check distinct marital status values for standardization
SELECT DISTINCT 
    cst_marital_status
FROM silver.crm_cust_info
ORDER BY cst_marital_status;

-- ====================================================================
-- Check: silver.crm_prd_info
-- ====================================================================

-- Check for NULLs or duplicates in product ID
-- Expectation: No results
SELECT 
    prd_id,
    COUNT(*) AS record_count
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for unwanted spaces in product name
-- Expectation: No results
SELECT 
    prd_nm
FROM silver.crm_prd_info
WHERE prd_nm <> TRIM(prd_nm);

-- Check for NULL or negative product cost
-- Expectation: No results
SELECT 
    prd_cost
FROM silver.crm_prd_info
WHERE prd_cost IS NULL
   OR prd_cost < 0;

-- Check distinct product line values for standardization
SELECT DISTINCT 
    prd_line
FROM silver.crm_prd_info
ORDER BY prd_line;

-- Check for invalid product date ranges
-- Expectation: No results
SELECT 
    *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- ====================================================================
-- Check: silver.crm_sales_details
-- ====================================================================

-- Check for NULLs in important sales fields
-- Expectation: No results
SELECT 
    *
FROM silver.crm_sales_details
WHERE sls_ord_num IS NULL
   OR sls_prd_key IS NULL
   OR sls_cust_id IS NULL;

-- Check for invalid date order
-- Expectation: No results
SELECT 
    *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
   OR sls_order_dt > sls_due_dt;

-- Check sales consistency: sales = quantity * price
-- Expectation: No results
SELECT DISTINCT
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales IS NULL
   OR sls_quantity IS NULL
   OR sls_price IS NULL
   OR sls_sales <= 0
   OR sls_quantity <= 0
   OR sls_price <= 0
   OR sls_sales <> sls_quantity * sls_price
ORDER BY sls_sales, sls_quantity, sls_price;

-- ====================================================================
-- Check: silver.erp_cust_az12
-- ====================================================================

-- Check for out-of-range birthdates
-- Expectation: Birthdates between 1924-01-01 and today
SELECT DISTINCT
    bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01'
   OR bdate > CAST(GETDATE() AS DATE)
ORDER BY bdate;

-- Check distinct gender values for standardization
SELECT DISTINCT
    gen
FROM silver.erp_cust_az12
ORDER BY gen;

-- ====================================================================
-- Check: silver.erp_loc_a101
-- ====================================================================

-- Check distinct country values for standardization
SELECT DISTINCT
    cntry
FROM silver.erp_loc_a101
ORDER BY cntry;

-- ====================================================================
-- Check: silver.erp_px_cat_g1v2
-- ====================================================================

-- Check for unwanted spaces
-- Expectation: No results
SELECT
    *
FROM silver.erp_px_cat_g1v2
WHERE cat <> TRIM(cat)
   OR subcat <> TRIM(subcat)
   OR maintenance <> TRIM(maintenance);

-- Check distinct maintenance values for standardization
SELECT DISTINCT
    maintenance
FROM silver.erp_px_cat_g1v2
ORDER BY maintenance;
