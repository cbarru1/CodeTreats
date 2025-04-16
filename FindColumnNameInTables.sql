SELECT      c.name  AS 'ColumnName'
            ,s.name as 'Schema', t.name AS 'TableName'
FROM        sys.columns c
JOIN        sys.tables  t   ON c.object_id = t.object_id
JOIN		sys.schemas s on t.schema_id = s.schema_id
WHERE       c.name LIKE '%ModifyVendorUserID%'
ORDER BY    TableName
            ,ColumnName;