USE IDFES
GO 

UPDATE  dbo.Site
SET site.Address =  REplace(Site.Address, 'ALS ', '' ) 
WHERE site.Address LIKE '%ALS%'
GO
