-- Drop a temporary table 
-- Drop the table if it already exists
IF OBJECT_ID('tempDB..#tempCC', 'U') IS NOT NULL
DROP TABLE #tempCC
GO
-- Create the temporary table 
-- Distinct calculated on integer PK
-- Execution performance boost
SELECT DISTINCT 
    HRID
    ,CustomerID
INTO #tempCC
FROM CustContact;

SELECT 
		 #tempCC.[HRID]
         ,Customer.CustName -- add the string here
FROM #tempcc
INNER JOIN Customer ON #tempCC.CustomerID = Customer.CustomerID
ORDER BY HRID
