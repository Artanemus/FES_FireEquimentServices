USE [IDFES]
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.Station DROP CONSTRAINT Equipment_Station
go
ALTER TABLE dbo.Test DROP CONSTRAINT Station_Test
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.Equipment.PK177','PK177_07072021052935001','INDEX'
go
EXEC sp_rename 'dbo.ChemicalType_Equipment','ChemicalTy_07072021052935002'
go
EXEC sp_rename 'dbo.EquipBrand_Equipment','EquipBrand_07072021052935003'
go
EXEC sp_rename 'dbo.EquipType_Equipment','EquipType__07072021052935004'
go
EXEC sp_rename 'dbo.LightLampType_Equipment','LightLampT_07072021052935005'
go
EXEC sp_rename 'dbo.LightType_Equipment','LightType__07072021052935006'
go
EXEC sp_rename 'dbo.StationType_Equipment','StationTyp_07072021052935007'
go
EXEC sp_rename 'dbo.DF__Equipment__UseGl__24134F1B', 'DF__Equipm_07072021052935008',OBJECT
go
EXEC sp_rename 'dbo.DF__Equipment__IsArc__36470DEF', 'DF__Equipm_07072021052935009',OBJECT
go
EXEC sp_rename 'dbo.Equipment','Equipment_07072021052935000',OBJECT
go
CREATE TABLE dbo.Equipment
(
    EquipmentID        int           IDENTITY,
    Caption            nvarchar(64)  NULL,
    ShortCaption       nvarchar(50)  NULL,
    NetWeight          float         NULL,
    GrossWeight        float         NULL,
    Litres             float         NULL,
    Height             float         NULL,
    Width              float         NULL,
    Power              float         NULL,
    IsArchived         bit           CONSTRAINT DF__Equipment__IsArc__36470DEF DEFAULT ((0)) NULL,
    UsedByDate         datetime      NULL,
    CreatedOn          datetime      NULL,
    UseGlobalLifeCycle bit           CONSTRAINT DF__Equipment__UseGl__24134F1B DEFAULT ((0)) NULL,
    MinorInterval      float         NULL,
    MajorInterval      float         NULL,
    EquipTypeID        int           NULL,
    ChemicalTypeID     int           NULL,
    EquipBrandID       int           NULL,
    LightTypeID        int           NULL,
    LightLampTypeID    int           NULL,
    StationTypeID      int           NULL
)
ON [PRIMARY]
go
EXEC sp_rename 'dbo.Station.PK154','PK154_07072021052936001','INDEX'
go
EXEC sp_rename 'dbo.Site_Station','Site_Stati_07072021052936003'
go
EXEC sp_rename 'dbo.StationType_Station','StationTyp_07072021052936004'
go
EXEC sp_rename 'dbo.DF__Station__IsEmpty__1DB06A4F', 'DF__Statio_07072021052936005',OBJECT
go
EXEC sp_rename 'dbo.Station','Station_07072021052936000',OBJECT
go
CREATE TABLE dbo.Station
(
    StationID     int            IDENTITY,
    StationNum    float          NULL,
    Location      nvarchar(128)  NULL,
    Note          text           NULL,
    CreatedOn     datetime       NULL,
    LifeCycleSeed datetime       NULL,
    IsEmpty       bit            CONSTRAINT DF__Station__IsEmpty__1DB06A4F DEFAULT ((0)) NULL,
    IsManaged     bit            NULL,
    StationTypeID int            NULL,
    SiteID        int            NULL,
    EquipmentID   int            NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.Station.IsManaged'
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.Equipment ON
go
INSERT INTO dbo.Equipment(
                          EquipmentID,
                          Caption,
                          ShortCaption,
                          NetWeight,
                          GrossWeight,
                          Litres,
                          Height,
                          Width,
                          Power,
                          IsArchived,
                          UsedByDate,
                          CreatedOn,
                          UseGlobalLifeCycle,
                          MinorInterval,
                          MajorInterval,
                          EquipTypeID,
                          ChemicalTypeID,
                          EquipBrandID,
                          LightTypeID,
                          LightLampTypeID,
                          StationTypeID
                         )
                   SELECT 
                          EquipmentID,
                          Caption,
                          ShortCaption,
                          NetWeight,
                          GrossWeight,
                          Litres,
                          Height,
                          Width,
                          NULL,
                          IsArchived,
                          UsedByDate,
                          CreatedOn,
                          UseGlobalLifeCycle,
                          MinorInterval,
                          MajorInterval,
                          EquipTypeID,
                          ChemicalTypeID,
                          EquipBrandID,
                          LightTypeID,
                          LightLampTypeID,
                          StationTypeID
                     FROM dbo.Equipment_07072021052935000 
go
SET IDENTITY_INSERT dbo.Equipment OFF
go
SET IDENTITY_INSERT dbo.Station ON
go
INSERT INTO dbo.Station(
                        StationID,
                        StationNum,
                        Location,
                        Note,
                        CreatedOn,
                        LifeCycleSeed,
                        IsEmpty,
                        IsManaged,
                        StationTypeID,
                        SiteID,
                        EquipmentID
                       )
                 SELECT 
                        StationID,
                        StationNum,
                        Location,
                        Note,
                        CreatedOn,
                        LifeCycleSeed,
                        IsEmpty,
                        NULL,
                        StationTypeID,
                        SiteID,
                        EquipmentID
                   FROM dbo.Station_07072021052936000 
go
SET IDENTITY_INSERT dbo.Station OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.Equipment ADD CONSTRAINT PK177
PRIMARY KEY CLUSTERED (EquipmentID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT PK154
PRIMARY KEY CLUSTERED (StationID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.Station ADD CONSTRAINT Equipment_Station
FOREIGN KEY (EquipmentID)
REFERENCES dbo.Equipment (EquipmentID)
go
ALTER TABLE dbo.Test ADD CONSTRAINT Station_Test
FOREIGN KEY (StationID)
REFERENCES dbo.Station (StationID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT ChemicalType_Equipment
FOREIGN KEY (ChemicalTypeID)
REFERENCES dbo.ChemicalType (ChemicalTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT EquipBrand_Equipment
FOREIGN KEY (EquipBrandID)
REFERENCES dbo.EquipBrand (EquipBrandID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT EquipType_Equipment
FOREIGN KEY (EquipTypeID)
REFERENCES dbo.EquipType (EquipTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightLampType_Equipment
FOREIGN KEY (LightLampTypeID)
REFERENCES dbo.LightLampType (LightLampTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT LightType_Equipment
FOREIGN KEY (LightTypeID)
REFERENCES dbo.LightType (LightTypeID)
go
ALTER TABLE dbo.Equipment ADD CONSTRAINT StationType_Equipment
FOREIGN KEY (StationTypeID)
REFERENCES dbo.StationType (StationTypeID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT Site_Station
FOREIGN KEY (SiteID)
REFERENCES dbo.Site (SiteID)
go
ALTER TABLE dbo.Station ADD CONSTRAINT StationType_Station
FOREIGN KEY (StationTypeID)
REFERENCES dbo.StationType (StationTypeID)
go
