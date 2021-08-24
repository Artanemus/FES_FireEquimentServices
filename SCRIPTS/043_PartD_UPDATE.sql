USE [IDFES]
GO

UPDATE [dbo].[EquipType]
SET
      [ShortCaption] = N'HYD'
      ,[MinorLifeCycle] = 12
      ,[MajorLifeCycle] = 60
      ,[NumOfLevels] = 2
      ,[ServiceInterval] = 6
      ,[CoreGroupID] = 3
WHERE EquipTypeID = 1

UPDATE [dbo].[EquipType]
SET
      [ShortCaption] = N'F\B'
      ,[MinorLifeCycle] = 0
      ,[MajorLifeCycle] = 0
      ,[NumOfLevels] = 2
      ,[ServiceInterval] = 6
      ,[CoreGroupID] = 1
WHERE EquipTypeID = 2


UPDATE [dbo].[EquipType]
SET
      [ShortCaption] = N'FX'
      ,[MinorLifeCycle] = 12
      ,[MajorLifeCycle] = 60
      ,[NumOfLevels] = 2
      ,[ServiceInterval] = 6
      ,[CoreGroupID] = 1
WHERE EquipTypeID = 3

UPDATE [dbo].[EquipType]
SET
      [ShortCaption] = N'F\H'
      ,[MinorLifeCycle] = 12
      ,[MajorLifeCycle] = 60
      ,[NumOfLevels] = 2
      ,[ServiceInterval] = 6
      ,[CoreGroupID] = 3
WHERE EquipTypeID = 4

UPDATE [dbo].[EquipType]
SET
	[Caption] = N'Light'
      ,[ShortCaption] = N'Light'
      ,[MinorLifeCycle] = 0
      ,[MajorLifeCycle] = 0
      ,[NumOfLevels] = 2
      ,[ServiceInterval] = 6
      ,[CoreGroupID] = 2
WHERE EquipTypeID = 5


-- ##############################################################################################
-- MISSING ...
-- CREATION DATES ... 
-- ##############################################################################################
UPDATE [dbo].[RoleList] SET [CreatedOn] = GETDATE()
WHERE [CreatedOn] IS NULL
GO

-- NEW FIELD INIT
UPDATE [dbo].[InspectionOrder]
   SET [ServiceInterval] = 6
GO

-- assign coregroup ID to stations
-- UNFORTUNATELY this doesn't assign an ID to EMPTY STATIONS...
-- 
UPDATE [dbo].[Station]
SET [CoreGroupID] = dbo.coregroup.CoreGroupID
FROM [dbo].[Station]
inner join Equipment ON Station.EquipmentID = Equipment.EquipmentID
inner join EquipType
inner join CoreGroup ON EquipType.CoreGroupID = CoreGroup.CoreGroupID ON Equipment.EquipTypeID = EquipType.EquipTypeID
WHERE dbo.Equipment.EquipmentID is not null
GO



-- ##############################################################################################
-- RESTORE OLD VERSION ... AS DATABASE IDFES_OLD
-- THEN RUN THIS  .....
-- NOTE: using alias 'old' removes error 'same exposed names'
-- ##############################################################################################

--UPDATE dbo.Station
--SET dbo.station.CoreGroupID = old.StationTypeID
--FROM IDFES.dbo.Station
--INNER JOIN IDFES_OLD.dbo.Station AS old ON IDFES.dbo.station.StationID = old.StationID
--WHERE IDFES.dbo.Station.CoreGroupID IS NULL

-- after successful assignment ....
-- DELETE FROM dbo.Station WHERE (((dbo.Station.CoreGroupID)=1) AND ((dbo.Station.Location) Like N'%EMERG%'));


-- ##############################################################################################
-- MISSING ...
-- ISARCHIVED STATES ... 
-- ##############################################################################################

GO


