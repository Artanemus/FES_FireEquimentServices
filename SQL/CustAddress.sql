--USE IDFES;

SELECT [CustAddressID],
       [CustomerID],
       [CustAddress].[AddressTypeID],
       [PostcodeID],
       [Address],
       [CreatedOn],
       [CustAddress].[IsArchived],
       [SortList],
       [AddressType].AliasCust
FROM [IDFES].[dbo].[CustAddress]
    INNER JOIN [IDFES].[dbo].[AddressType]
        ON [CustAddress].[AddressTypeID] = [AddressType].[AddressTypeID];