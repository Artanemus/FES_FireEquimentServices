USE IDFES
GO

SELECT CustomerID
	,dbo.GetCustAddressID(CustomerID) AS aAddrID
	,dbo.GetCustContactID(CustomerID) AS aContactID
	,dbo.GetCustContactNum(CustomerID) AS aContactNum
	,dbo.GetCustAddrSingleLine(CustomerID, 1) AS aAddr
FROM Customer
Go

SELECT HRID
	,dbo.GetHRAddressID(HRID) AS aAddrID
	,dbo.GetHRContactNum(HRID) AS aContactNum
	,dbo.GetHRAddrSingleLine(HRID, 1) AS aAddr
FROM HR
GO