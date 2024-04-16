USE [IDFES]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.InspectionOrder DROP COLUMN TMSBkgrdColor,TMSTrackBarColor
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.InspectionOrder DROP CONSTRAINT InspectionStatusInspectionOrder
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.InspectionStatus.PK_InspectionStatus','PK_Inspect_04162024064959001','INDEX'
go
EXEC sp_rename 'dbo.InspectionStatus','Inspection_04162024064959000',OBJECT
go
CREATE TABLE dbo.InspectionStatus
(
    InspectionStatusID      int            IDENTITY,
    Caption                 nvarchar(50)   NULL,
    Description             nvarchar(128)  NULL,
    StackOrder              int            NULL,
    TMSNotesColor           int            NULL,
    TMSCaptionColor         int            NULL,
    TMSSelectedCaptionColor int            NULL,
    TMSTrackColor           int            NULL,
    TMSSelectedTrackColor   int            NULL,
    TMSLinkColor            int            NULL
)
ON [PRIMARY]
go
DROP TABLE dbo.InspectTim_04152024040801000
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.InspectionStatus ON
go
INSERT INTO dbo.InspectionStatus(
                                 InspectionStatusID,
                                 Caption,
                                 Description,
                                 StackOrder,
                                 TMSNotesColor,
                                 TMSCaptionColor,
                                 TMSSelectedCaptionColor,
                                 TMSTrackColor,
                                 TMSSelectedTrackColor,
                                 TMSLinkColor
                                )
                          SELECT 
                                 InspectionStatusID,
                                 Caption,
                                 Description,
                                 StackOrder,
                                 NULL,
                                 NULL,
                                 NULL,
                                 NULL,
                                 NULL,
                                 NULL
                            FROM dbo.Inspection_04162024064959000 
go
SET IDENTITY_INSERT dbo.InspectionStatus OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.InspectionStatus ADD CONSTRAINT PK_InspectionStatus
PRIMARY KEY CLUSTERED (InspectionStatusID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.InspectionOrder ADD CONSTRAINT InspectionStatusInspectionOrder
FOREIGN KEY (InspectionStatusID)
REFERENCES dbo.InspectionStatus (InspectionStatusID)
go
