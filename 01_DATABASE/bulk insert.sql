USE E_Commerce_Sales_Data;
GO

BULK INSERT dbo.Customers
FROM 'C:\SQLDATA\E_Commerce_Sales_Analysis\Customers.csv'
WITH
(
    DATAFILETYPE = 'char',
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO