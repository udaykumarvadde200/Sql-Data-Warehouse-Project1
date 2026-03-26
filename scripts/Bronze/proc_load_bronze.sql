CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE 
        @batch_start_time DATETIME,
        @base_path NVARCHAR(500),
        @crm_path NVARCHAR(500),
        @erp_path NVARCHAR(500),
        @sql NVARCHAR(MAX);

    BEGIN TRY
        SET @batch_start_time = GETDATE();

        PRINT '=========================================';
        PRINT 'Loading Bronze Layer';
        PRINT '=========================================';

        -- =========================================
        -- Update this base path before execution
        -- =========================================
        SET @base_path = 'REPLACE_WITH_YOUR_PROJECT_PATH\datasets\';
        SET @crm_path  = @base_path + 'source_crm\';
        SET @erp_path  = @base_path + 'source_erp\';

        -- =========================================
        -- Load CRM Tables
        -- =========================================

        PRINT 'Loading bronze.crm_cust_info...';
        TRUNCATE TABLE bronze.crm_cust_info;

        SET @sql = '
        BULK INSERT bronze.crm_cust_info
        FROM ''' + @crm_path + 'cust_info.csv''
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            ROWTERMINATOR = ''0x0A'',
            TABLOCK
        );';
        EXEC(@sql);

        PRINT 'Loading bronze.crm_prd_info...';
        TRUNCATE TABLE bronze.crm_prd_info;

        SET @sql = '
        BULK INSERT bronze.crm_prd_info
        FROM ''' + @crm_path + 'prd_info.csv''
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            ROWTERMINATOR = ''0x0A'',
            TABLOCK
        );';
        EXEC(@sql);

        PRINT 'Loading bronze.crm_sales_details...';
        TRUNCATE TABLE bronze.crm_sales_details;

        SET @sql = '
        BULK INSERT bronze.crm_sales_details
        FROM ''' + @crm_path + 'sales_details.csv''
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            ROWTERMINATOR = ''0x0A'',
            TABLOCK
        );';
        EXEC(@sql);

        -- =========================================
        -- Load ERP Tables
        -- =========================================

        PRINT 'Loading bronze.erp_loc_a101...';
        TRUNCATE TABLE bronze.erp_loc_a101;

        SET @sql = '
        BULK INSERT bronze.erp_loc_a101
        FROM ''' + @erp_path + 'loc_a101.csv''
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            ROWTERMINATOR = ''0x0A'',
            TABLOCK
        );';
        EXEC(@sql);

        PRINT 'Loading bronze.erp_cust_az12...';
        TRUNCATE TABLE bronze.erp_cust_az12;

        SET @sql = '
        BULK INSERT bronze.erp_cust_az12
        FROM ''' + @erp_path + 'cust_az12.csv''
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            ROWTERMINATOR = ''0x0A'',
            TABLOCK
        );';
        EXEC(@sql);

        PRINT 'Loading bronze.erp_px_cat_g1v2...';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        SET @sql = '
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM ''' + @erp_path + 'px_cat_g1v2.csv''
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = '','',
            ROWTERMINATOR = ''0x0A'',
            TABLOCK
        );';
        EXEC(@sql);

        PRINT '=========================================';
        PRINT 'Bronze Layer Loading Completed';
        PRINT '=========================================';
    END TRY
    BEGIN CATCH
        PRINT '=========================================';
        PRINT 'ERROR OCCURRED DURING BRONZE LOAD';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT '=========================================';
    END CATCH
END;
GO
