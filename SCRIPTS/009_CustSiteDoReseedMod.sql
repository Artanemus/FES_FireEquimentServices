USE [IDFES]
go

-- Dictionary Object Alter SQL

CREATE DEFAULT dbo.BIT_0 AS 0
go

-- Standard Alter Table SQL

ALTER TABLE dbo.CustSite ADD DoReseed bit  NULL
go
EXEC sp_bindefault 'BIT_0', 'dbo.CustSite.DoReseed'
go
