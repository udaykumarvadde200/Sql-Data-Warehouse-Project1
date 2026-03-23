CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY
		SET @batch_start_time = GETDATE();

		PRINT 'Loading Bronze Layer';

		-- CRM Tables
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\uday kumar\Desktop\DATAWAREOUSE PROJECT\DaraWarepuse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\uday kumar\Desktop\DATAWAREOUSE PROJECT\DaraWarepuse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\uday kumar\Desktop\DATAWAREOUSE PROJECT\DaraWarepuse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		-- ERP Tables
		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\uday kumar\Desktop\DATAWAREOUSE PROJECT\DaraWarepuse\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\uday kumar\Desktop\DATAWAREOUSE PROJECT\DaraWarepuse\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\uday kumar\Desktop\DATAWAREOUSE PROJECT\DaraWarepuse\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

		PRINT 'Loading Completed';

	END TRY
	BEGIN CATCH
		PRINT 'ERROR: ' + ERROR_MESSAGE();
	END CATCH
END;