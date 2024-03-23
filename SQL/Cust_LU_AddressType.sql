-- USE IDFES;
SELECT 
		 [AddressTypeID]
		,[Caption]
		,[UsedByHR]
		,[AliasHR]
		,[UsedByCust]
		,[AliasCust]
		,[IsArchived]
FROM [IDFES].[dbo].[AddressType] 
WHERE UsedByCust = 1 AND IsArchived = 0; -- AND IsActive = 1;