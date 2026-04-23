CREATE PROCEDURE sp_create_dim_priority
AS
BEGIN
  CREATE TABLE [Computer_std].[dbo].[dim_priority](
    [Priority_id] INT IDENTITY(1,1) PRIMARY KEY,
    [Priority] [nvarchar](100) NOT NULL
   )
   INSERT INTO [Computer_std].[dbo].[dim_priority] (Priority)
   SELECT DISTINCT Priority
   FROM [Computer_std].[dbo].[raw_pc_data]
END;