-- I. For Stocks:
-- 1. Most Actives from [all_stocks_5yr]
-- SQL Query:

--SELECT TOP (10)
--    Name, 
--    SUM(CAST(volume AS BIGINT)) AS TotalVolume
--FROM 
--    all_stocks_5yr
--GROUP BY 
--    Name
--ORDER BY 
--    TotalVolume DESC;
-- Create Date Dimension Table
CREATE TABLE DateDimension (
    Date DATE PRIMARY KEY,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    Day INT,
    PeriodType VARCHAR(50)
);

-- Populate Date Dimension Table
INSERT INTO DateDimension (Date, Year, Quarter, Month, Week, Day, PeriodType)
SELECT 
    Date,
    YEAR(Date) AS Year,
    DATEPART(QUARTER, Date) AS Quarter,
    MONTH(Date) AS Month,
    DATEPART(WEEK, Date) AS Week,
    DAY(Date) AS Day,
    'Daily' AS PeriodType
FROM 
    (SELECT DISTINCT Date FROM all_stocks_5yr) AS Dates;

-- Repeat the above INSERT for other PeriodTypes (Weekly, Monthly, Quarterly, etc.)



