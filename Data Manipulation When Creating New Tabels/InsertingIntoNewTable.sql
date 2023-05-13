/****** Script for SelectTopNRows command from SSMS  ******/
SELECT CAST([time] AS DATETIME) AS time
      ,CAST([month] AS TINYINT) AS month
      ,CAST([date] AS DATE) AS date
      ,CAST([day] AS VARCHAR(10)) AS day
      ,CAST([hour] AS TINYINT) AS hour
      ,CAST([entryPrice] AS DECIMAL(7,2)) AS entryPrice
      ,CAST([exitPrice] AS DECIMAL(7,2)) AS exitPrice
	  ,CAST([maxRunUp] AS DECIMAL(6,2)) AS maxRunUp
	  ,CAST([maxDrawdown] AS DECIMAL(6,2)) AS maxDrawdown
	  ,CAST(returns AS DECIMAL(6,2)) AS returns
	  ,CAST([type] AS VARCHAR(6)) AS type
  INTO [AutoTrader].[dbo].[Backtesting_Results_Manipulated]
  FROM [AutoTrader].[dbo].[Backtesting_Results]
  WHERE 1=1
  AND [time] != '1/10/2023 18:35'
  AND [time] IS NOT NULL