USE [IDFES]
go

-- Standard Alter Table SQL

EXEC sp_rename 'dbo.HRAddress.SortList', 'StackOrder','COLUMN'
go
EXEC sp_rename 'dbo.HREmail.SortList', 'StackOrder','COLUMN'
go
EXEC sp_rename 'dbo.HRNumber.SortList', 'StackOrder','COLUMN'
go
EXEC sp_rename 'dbo.CustAddress.SortList', 'StackOrder','COLUMN'
go
EXEC sp_rename 'dbo.CustContact.SortList', 'StackOrder','COLUMN'
go
EXEC sp_rename 'dbo.CustEmail.SortList', 'StackOrder','COLUMN'
go
EXEC sp_rename 'dbo.CustNumber.SortList', 'StackOrder','COLUMN'
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.InspectTime DROP CONSTRAINT HRInspectTime
go
ALTER TABLE dbo.CustSite DROP CONSTRAINT HRCustSite
go
ALTER TABLE dbo.HRAddress DROP CONSTRAINT HRHRAddress
go
ALTER TABLE dbo.CustContact DROP CONSTRAINT HRCustContact
go
ALTER TABLE dbo.RoleList DROP CONSTRAINT HRRoleList
go
ALTER TABLE dbo.HRNumber DROP CONSTRAINT HRHRNumber
go
ALTER TABLE dbo.SurveyOrder DROP CONSTRAINT HRSurveyOrder
go
ALTER TABLE dbo.HREmail DROP CONSTRAINT HRHREmail
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.HR.PK_HR','PK_HR_04222024051444001','INDEX'
go
EXEC sp_rename 'dbo.DF__HR__IsArchived__17F790F9', 'DF__HR__Is_04222024051444002',OBJECT
go
EXEC sp_rename 'dbo.HR','HR_04222024051444000',OBJECT
go
CREATE TABLE dbo.HR
(
    HRID                 int           IDENTITY,
    EmergencyContactHRID int           NULL,
    LastName             nvarchar(64)  NULL,
    FirstName            nvarchar(64)  NULL,
    MiddleName           nvarchar(64)  NULL,
    Note                 text          NULL,
    DOB                  datetime      NULL,
    UserLoginName        nvarchar(64)  NULL,
    CreatedOn            datetime      NULL,
    ModifiedOn           datetime      NULL,
    IsArchived           bit           CONSTRAINT DF__HR__IsArchived__17F790F9 DEFAULT ((0))  NOT NULL
)
ON [PRIMARY]
go
DROP TABLE dbo.HRZone
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.HR ON
go
INSERT INTO dbo.HR(
                   HRID,
                   EmergencyContactHRID,
                   LastName,
                   FirstName,
                   MiddleName,
                   Note,
                   DOB,
                   UserLoginName,
                   CreatedOn,
                   ModifiedOn,
                   IsArchived
                  )
            SELECT 
                   HRID,
                   EmergencyContactHRID,
                   SUBSTRING(LastName, 1, 64),
                   SUBSTRING(FirstName, 1, 64),
                   NULL,
                   Note,
                   DOB,
                   SUBSTRING(UserLoginName, 1, 64),
                   CreatedOn,
                   ModifiedOn,
                   IsArchived
              FROM dbo.HR_04222024051444000 
go
SET IDENTITY_INSERT dbo.HR OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.HR ADD CONSTRAINT PK_HR
PRIMARY KEY CLUSTERED (HRID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.InspectTime ADD CONSTRAINT HRInspectTime
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.CustSite ADD CONSTRAINT HRCustSite
FOREIGN KEY (SiteContactID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.HRAddress ADD CONSTRAINT HRHRAddress
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.CustContact ADD CONSTRAINT HRCustContact
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.RoleList ADD CONSTRAINT HRRoleList
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.HRNumber ADD CONSTRAINT HRHRNumber
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.SurveyOrder ADD CONSTRAINT HRSurveyOrder
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.HREmail ADD CONSTRAINT HRHREmail
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.HR ADD FOREIGN KEY (EmergencyContactHRID)
REFERENCES dbo.HR (HRID)
go
