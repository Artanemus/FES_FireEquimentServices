USE [IDFES]
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Test DROP CONSTRAINT TestResult_TestA
go
ALTER TABLE dbo.Test DROP CONSTRAINT TestResult_TestB
go

-- Drop Constraint, Rename and Create Table SQL

DROP TABLE dbo.Test_08052021035032000
go
EXEC sp_rename 'dbo.TestResult.PK267','PK267_08052021040140001','INDEX'
go
EXEC sp_rename 'dbo.TestResult','TestResult_08052021040140000',OBJECT
go
CREATE TABLE dbo.TestResult
(
    TestResultID int           IDENTITY,
    Caption      nvarchar(50)  NULL,
    ShortCaption nvarchar(50)  NULL
)
ON [PRIMARY]
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.TestResult ON
go
INSERT INTO dbo.TestResult(
                           TestResultID,
                           Caption,
                           ShortCaption
                          )
                    SELECT 
                           TestResultID,
                           Caption,
                           ShortCaption
                      FROM dbo.TestResult_08052021040140000 
go
SET IDENTITY_INSERT dbo.TestResult OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.TestResult ADD CONSTRAINT PK267
PRIMARY KEY CLUSTERED (TestResultID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_TestA
FOREIGN KEY (TestA)
REFERENCES dbo.TestResult (TestResultID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_TestB
FOREIGN KEY (TestB)
REFERENCES dbo.TestResult (TestResultID)
go
