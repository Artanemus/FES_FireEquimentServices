USE IDFES
GO

DELETE dbo.InspectionOrder
FROM dbo.InspectionOrder LEFT JOIN dbo.Test ON dbo.InspectionOrder.InspectionOrderID = dbo.Test.InspectionOrderID
WHERE (((dbo.InspectionOrder.InspectionStatusID)=1) AND ((dbo.Test.TestID) Is Null));
