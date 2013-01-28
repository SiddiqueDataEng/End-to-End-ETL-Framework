/*
 * End to End ETL Framework
 * Project #90 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS, MSSQL
 * Created: 2014
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'EnterpriseETL')
BEGIN
    ALTER DATABASE EnterpriseETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EnterpriseETL;
END
GO

CREATE DATABASE EnterpriseETL
ON PRIMARY
(
    NAME = 'EnterpriseETL_Data',
    FILENAME = 'C:\SQLData\EnterpriseETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'EnterpriseETL_Log',
    FILENAME = 'C:\SQLData\EnterpriseETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE EnterpriseETL SET RECOVERY SIMPLE;
ALTER DATABASE EnterpriseETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE EnterpriseETL;
GO

PRINT 'Database EnterpriseETL created successfully';
PRINT 'Project: End to End ETL Framework';
PRINT 'Description: Enterprise ETL pattern standardization';
GO
