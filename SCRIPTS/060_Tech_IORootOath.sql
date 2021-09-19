USE [IDFES]
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.CompanyInfo DROP CONSTRAINT Global_CompanyInfo
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.Global.PK233','PK233_09132021232910001','INDEX'
go
EXEC sp_rename 'dbo.Global','Global_09132021232910000',OBJECT
go
CREATE TABLE dbo.[Global]
(
    GlobalID                 int              NOT NULL,
    DefNumOfLevels           int             NULL,
    DefStartLevel            int             NULL,
    TechInspectOrderRootPath nvarchar(2048)  NULL,
    SQLversion               int             NULL,
    SQLmajor                 int             NULL,
    SQLminor                 int             NULL,
    SQLbuild                 int             NULL,
    Author                   nvarchar(64)    NULL,
    AuthorEmail              nvarchar(256)   NULL,
    Copyright                nvarchar(128)   NULL
)
ON [PRIMARY]
go

-- Insert Data SQL

INSERT INTO dbo.[Global](
                         GlobalID,
                         DefNumOfLevels,
                         DefStartLevel,
                         TechInspectOrderRootPath,
                         SQLversion,
                         SQLmajor,
                         SQLminor,
                         SQLbuild,
                         Author,
                         AuthorEmail,
                         Copyright
                        )
                  SELECT 
                         GlobalID,
                         DefNumOfLevels,
                         DefStartLevel,
                         NULL,
                         SQLversion,
                         SQLmajor,
                         SQLminor,
                         SQLbuild,
                         Author,
                         AuthorEmail,
                         Copyright
                    FROM dbo.Global_09132021232910000 
go

-- Add Constraint SQL

ALTER TABLE dbo.[Global] ADD CONSTRAINT PK233
PRIMARY KEY CLUSTERED (GlobalID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.CompanyInfo ADD CONSTRAINT Global_CompanyInfo
FOREIGN KEY (GlobalID)
REFERENCES dbo.[Global] (GlobalID)
go
