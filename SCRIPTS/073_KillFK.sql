USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.Station DROP CONSTRAINT PowerBoard_Station
go
ALTER TABLE dbo.Station DROP COLUMN PowerBoardID
go
EXEC sp_rename 'dbo.Station.CircuitBoardNum', 'CircuitBreakerNum','COLUMN'
go
