CREATE DATABASE Sample_db_snap ON (
    NAME = [Sample_DB],
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Data\Sample_DB_ss.ss'
    ) AS SNAPSHOT OF [Sample_DB];
GO