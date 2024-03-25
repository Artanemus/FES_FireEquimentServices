SELECT [CustContactID]
     , [CustContact].[CustomerID]
     , [CustContact].[HRID]
     , [CustContact].[CreatedOn]
     , [CustContact].[Caption]
     , [CustContact].[IsArchived]
     , [CustContact].[SortList]
     , [CustContact].[ContactTypeID]
     , Customer.CustName
     , CONCAT(hr.FirstName, ' ', UPPER(hr.LastName))
     , ContactType.AliasCust AS ContactTypeStr
FROM [IDFES].[dbo].[CustContact]
    INNER JOIN HR
        ON CustContact.HRID = HR.HRID
    LEFT JOIN Customer
        ON custcontact.CustomerID = Customer.CustomerID
    LEFT JOIN ContactType
        ON CustContact.ContactTypeID = ContactType.ContactTypeID