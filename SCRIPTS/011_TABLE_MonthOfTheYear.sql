USE [IDFES]
go

-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE dbo.MonthOfYear
(
    MonthOfYearID int           IDENTITY,
    MonthNum      int            NOT NULL,
    MonthStr      nvarchar(50)  NULL,
    CONSTRAINT PK277
    PRIMARY KEY CLUSTERED (MonthOfYearID)
)
go
