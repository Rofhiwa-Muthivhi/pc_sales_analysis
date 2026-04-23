CREATE PROCEDURE sp_create_dim_sales_person
AS
BEGIN
    CREATE TABLE [Computer_std].[dbo].[dim_sales_person](
    [Sales_Person_id] INT IDENTITY(1,1) PRIMARY KEY,
    [Sales_Person_Name] [nvarchar](150) NOT NULL,
    [Sales_Person_Department] [nvarchar](150) NOT NULL
   )
    INSERT INTO [Computer_std].[dbo].[dim_sales_person] (Sales_Person_Name, Sales_Person_Department)
   SELECT DISTINCT Sales_Person_Name, Sales_Person_Department
   FROM [Computer_std].[dbo].[raw_pc_data]
END;