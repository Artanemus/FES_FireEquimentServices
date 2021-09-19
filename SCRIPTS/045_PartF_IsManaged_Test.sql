USE [IDFES]
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.Test.PK217','PK217_09022021021007001','INDEX'
go
EXEC sp_rename 'dbo.InspectionOrder_Test','Inspection_09022021021007002'
go
EXEC sp_rename 'dbo.Station_Test','Station_Te_09022021021007003'
go
EXEC sp_rename 'dbo.TestAction_Test','TestAction_09022021021007004'
go
EXEC sp_rename 'dbo.TestLifeCycle_Test','TestLifeCy_09022021021007005'
go
EXEC sp_rename 'dbo.Equipment_Test','Equipment__09022021021007006'
go
EXEC sp_rename 'dbo.TestResult_TestA','TestResult_09022021021007007'
go
EXEC sp_rename 'dbo.TestResult_TestB','TestResult_09022021021007008'
go
EXEC sp_rename 'dbo.DF__Test__Passed__17AD7836', 'DF__Test___09022021021007009',OBJECT
go
EXEC sp_rename 'dbo.Test','Test_09022021021007000',OBJECT
go
CREATE TABLE dbo.Test
(
    TestID            int            IDENTITY,
    StationNum        float          NULL,
    Location          nvarchar(128)  NULL,
    Note              nvarchar(128)  NULL,
    Passed            bit            CONSTRAINT DF__Test__Passed__17AD7836 DEFAULT ((0)) NULL,
    IsManaged         bit            NULL,
    EquipmentID       int            NULL,
    TestLifeCycleID   int            NULL,
    TestActionID      int            NULL,
    InspectionOrderID int            NULL,
    StationID         int            NULL,
    TestA             int            NULL,
    TestB             int            NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.Test.IsManaged'
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.Test ON
go
INSERT INTO dbo.Test(
                     TestID,
                     StationNum,
                     Location,
                     Note,
                     Passed,
                     IsManaged,
                     EquipmentID,
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     StationID,
                     TestA,
                     TestB
                    )
              SELECT 
                     TestID,
                     StationNum,
                     Location,
                     Note,
                     Passed,
                     NULL,
                     EquipmentID,
                     TestLifeCycleID,
                     TestActionID,
                     InspectionOrderID,
                     StationID,
                     TestA,
                     TestB
                FROM dbo.Test_09022021021007000 
go
SET IDENTITY_INSERT dbo.Test OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.Test ADD CONSTRAINT PK217
PRIMARY KEY CLUSTERED (TestID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Test ADD CONSTRAINT InspectionOrder_Test
FOREIGN KEY (InspectionOrderID)
REFERENCES dbo.InspectionOrder (InspectionOrderID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT Station_Test
FOREIGN KEY (StationID)
REFERENCES dbo.Station (StationID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestAction_Test
FOREIGN KEY (TestActionID)
REFERENCES dbo.TestAction (TestActionID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestLifeCycle_Test
FOREIGN KEY (TestLifeCycleID)
REFERENCES dbo.TestLifeCycle (TestLifeCycleID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT Equipment_Test
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_TestA
FOREIGN KEY (TestA)
REFERENCES dbo.TestResult (TestResultID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT TestResult_TestB
FOREIGN KEY (TestB)
REFERENCES dbo.TestResult (TestResultID)
go
