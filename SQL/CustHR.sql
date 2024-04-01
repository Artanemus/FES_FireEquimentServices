SELECT [CustContactID]
     , [CustContact].[CustomerID]
     , [CustContact].[HRID]
     , CONVERT(DATE, [CustContact].[CreatedOn], 102) AS ContactCreatedOn
     , dbo.GetHRSingleLine([CustContact].[HRID], 1) AS FName
     , ContactType.AliasCust AS ContactTypeStr
     --, [CustContact].[Caption]
     , [CustContact].[IsArchived]
     --, [CustContact].[SortList]
     --, [CustContact].[ContactTypeID]
FROM [IDFES].[dbo].[CustContact]
    INNER JOIN HR
        ON CustContact.HRID = HR.HRID
    LEFT JOIN ContactType
        ON CustContact.ContactTypeID = ContactType.ContactTypeID
WHERE CustContact.HRID IS NOT NULL