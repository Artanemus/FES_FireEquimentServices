USE IDFES
GO

DECLARE @StationID AS INT
DECLARE @DoMajor AS BIT

-- TEST CASE  - STATION HAS FX (3 year major LC)
SET @StationID = 2256;
SET @DoMajor = 1;

-- Drop a temporary table called '#tmpA'
-- Drop the table if it already exists
IF OBJECT_ID('tempDB..#tmpA', 'U') IS NOT NULL
    DROP TABLE #tmpA;

-- GO
-- Retrive the EquipmentID and StationNum.
-- Ignore stations with empty LifeCycleSeed DateTimes
SELECT StationNum
    , EquipmentID
    , SiteID
INTO #tmpA
FROM Station
WHERE StationID = @StationID
    AND LifeCycleSeed IS NOT NULL;

-- Drop a temporary table called '#tmpA'
-- Drop the table if it already exists
IF OBJECT_ID('tempDB..#tmpB', 'U') IS NOT NULL
    DROP TABLE #tmpB;

-- Lists successful TESTs with the STATION's equipment 
SELECT InspectionOrder.InspectionOrderID
    , InspectionOrder.InspectedOn
    , InspectionOrder.RequestedDT
    , TestLifeCycleID
-- , (CASE WHEN @DoMajor = 2 THEN 1 ELSE 0 END) AS DOMAJOR
INTO #tmpB
FROM InspectionOrder
INNER JOIN Test
    ON InspectionOrder.InspectionOrderID = Test.InspectionOrderID
-- pull tests for the given site, narrow list by station number and equipment type.
-- NOTE: TEST and STATION are loosly paired by a Non-Specific relationship via fieldname ReferenceID
-- This isn't used here...
INNER JOIN #tmpA
    ON #tmpA.SiteID = InspectionOrder.SiteID
        AND #tmpA.EquipmentID = Test.EquipmentID
        AND #tmpA.StationNum = Test.StationNum
-- The inspection status was COMPLETED 
WHERE (InspectionOrder.InspectionStatusID = 2)
    -- The equipment passed the inspection
    AND (Test.Passed = 1)
    -- A MAJOR life cycle test was performed 
    AND (
        (
            TestLifeCycleID = (
                CASE @DoMajor
                    WHEN 1
                        THEN 2
                    WHEN 0
                        THEN 1
                    END
                )
            )
        -- OR (TestLifeCycleID IS NULL)
        )
-- Most recent qualified test listed first
ORDER BY InspectionOrder.RequestedDT DESC;

-- PICK the last successful test that was completed for the station's equipment.
SELECT TOP 1 iif(InspectedOn IS NULL, RequestedDT, InspectedOn) AS DTofLastPassedInspection
    , InspectionOrderID
    , TestLifeCycleID
FROM #tmpB;
