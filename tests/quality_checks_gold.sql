/*
===============================================================================
Quality Checks for Gold Layer
===============================================================================
Description:
    This script validates the integrity and consistency of the Gold layer.
    The checks ensure:
    - Uniqueness of surrogate keys in dimension views
    - Referential integrity between fact and dimension views
    - Correct connectivity of the star schema for analytics
===============================================================================
*/

-- ====================================================================
-- Check: gold.dim_customers
-- ====================================================================

-- Check for duplicate customer surrogate keys
-- Expectation: No results
SELECT
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- Check for NULL customer surrogate keys
-- Expectation: No results
SELECT
    *
FROM gold.dim_customers
WHERE customer_key IS NULL;

-- ====================================================================
-- Check: gold.dim_products
-- ====================================================================

-- Check for duplicate product surrogate keys
-- Expectation: No results
SELECT
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- Check for NULL product surrogate keys
-- Expectation: No results
SELECT
    *
FROM gold.dim_products
WHERE product_key IS NULL;

-- ====================================================================
-- Check: gold.fact_sales
-- ====================================================================

-- Check referential integrity between fact and dimensions
-- Expectation: No results
SELECT
    f.*
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
WHERE c.customer_key IS NULL
   OR p.product_key IS NULL;
