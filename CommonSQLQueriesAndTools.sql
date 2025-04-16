--SQL Stuff

--Delete Temp Table If Exists
IF OBJECT_ID('tempdb..#Results') IS NOT NULL DROP TABLE #Results

--Find Tables with Constraints
	SELECT
	  table_name,
	  constraint_type,
	  constraint_name
	FROM information_schema.table_constraints
	--WHERE table_name = 'student';

--Get Open Transactions
	DBCC OPENTRAN
	SELECT * FROM sys.sysprocesses WHERE open_tran = 1

--Finding Special Characters
	select 'ItemScore',*
	from eva.ItemScore iscore
	with(nolock)
	where charindex(CHAR(0x1f), iscore.Notes, 0) > 0

--Enable/Disable Triggers
	-- Disable trigger if needed for bulk changes or whatever
	DISABLE TRIGGER vnd.TRG_VendorUser_InsertUpdate_UserName ON vnd.VendorUser

	--update vnd.vendoruser 
	--set UserName = 'cbarrugardensupplies'
	--where VendorUserID = 409383
	-- Re-enable trigger
	ENABLE TRIGGER vnd.TRG_VendorUser_InsertUpdate_UserName ON vnd.VendorUser

--Finding Tables with Specific Column Names
	--Search Tables:
	SELECT      c.name  AS 'ColumnName'
				,(SCHEMA_NAME(t.schema_id) + '.' + t.name) AS 'TableName'
	FROM        sys.columns c
	JOIN        sys.tables  t   ON c.object_id = t.object_id
	WHERE       c.name LIKE '%MyName%'
	ORDER BY    TableName
				,ColumnName;

	--Search Tables and Views:
	SELECT      COLUMN_NAME AS 'ColumnName'
				,TABLE_NAME AS  'TableName'
	FROM        INFORMATION_SCHEMA.COLUMNS
	WHERE       COLUMN_NAME LIKE '%MyName%'
	ORDER BY    TableName
				,ColumnName;

--Finding Tables
	SELECT * FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME LIKE '%VendorMergeNotification%'