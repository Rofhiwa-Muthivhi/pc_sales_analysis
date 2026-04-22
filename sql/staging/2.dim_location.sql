 -- Create table if not exist
  DROP TABLE [Computer_std].[dbo].[dim_location]
  CREATE TABLE [Computer_std].[dbo].[dim_location](
    [Location_id] INT IDENTITY(1,1) PRIMARY KEY,
    [Continent] [nvarchar](100) NOT NULL,
	[Country_or_State] [nvarchar](100) NOT NULL,
	[Province_or_City] [nvarchar](150) NOT NULL
   )
 
 --2 Insert data into table
   INSERT INTO [Computer_std].[dbo].[dim_location] (Continent, Country_or_State, Province_or_City)
   SELECT DISTINCT Continent, Country_or_State, Province_or_City
   FROM [Computer_std].[dbo].[raw_pc_data]

 --3 Select all data from dim location
   SELECT * FROM[Computer_std].[dbo].[dim_location]

  