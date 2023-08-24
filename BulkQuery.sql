USE test
GO
BULK INSERT WorldData
FROM 'D:\Transfer To Drive\New\Datasets\archive (6)\world-data-2023.csv'
WITH (
	--FORMAT = 'CSV',
	FIRSTROW = 2,
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a'
);


