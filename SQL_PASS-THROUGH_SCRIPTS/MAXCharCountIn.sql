USE IDFES 
GO
-- CUSTOMER'S NAME
with tmpA as
(
SELECT CustName,  Len(CustName) AS X FROM Customer
Where CustName IS NOT NULL
)
SELECT Max(tmpA.X) as MaxCustName FROM tmpA
GO
-- CUSTOMER'S ADDRESS
with tmpB as
(
SELECT CustAddress.Address,  Len(Address) AS X FROM CustAddress
Where Address IS NOT NULL
)
SELECT Max(tmpB.X) as MaxCustAddress FROM tmpB
GO

-- CUSTOMER'S EMAIL
with tmpE as
(
SELECT CustEmail.Email,  Len(Email) AS X FROM CustEmail
Where Email IS NOT NULL
)
SELECT Max(tmpE.X) as MaxCustEmail FROM tmpE
GO

-- SITE ADDRESS
with tmpC as
(
SELECT Site.Address,  Len(Site.Address) AS X FROM Site
Where Site.Address IS NOT NULL
)
SELECT Max(tmpC.X) as MaxSiteAddress FROM tmpC
GO
-- POSTCODE SINGLE LINE
with tmpD as
(
SELECT Len(CONCAT(Suburb, ' ' , State,  ' ', Postcode)) AS X FROM PostCode
)

SELECT Max(tmpD.X) as MaxPostCodeSingleLine FROM tmpD
GO

-- HR'S EMAIL
with tmpF as
(
SELECT HREmail.Email,  Len(Email) AS X FROM HREmail
Where Email IS NOT NULL
)
SELECT Max(tmpF.X) as MaxHREmail FROM tmpF
GO