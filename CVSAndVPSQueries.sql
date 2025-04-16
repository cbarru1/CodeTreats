Select vps.VendorID, vps.VendorPoolID, vps.StatusCode, count(*)--, vps.VendorPoolStatusID, vps.StatusCode, cvs.CompanyVendorStatusID, cvs.CompanyID, cvs.StatusCode, c.VendorPoolID
from vnd.vendorpoolstatus vps
	join com.CompanyVendorStatus cvs on cvs.VendorID = vps.VendorID
	join com.Company c on c.CompanyID = cvs.CompanyID
where vps.VendorPoolID = c.VendorPoolID
	AND vps.StatusCode != 'MERGED'
	and vps.VendorID = 10679
Group by vps.VendorID, vps.VendorPoolID, vps.StatusCode
Having count(*) > 1
order by vps.VendorID desc

select cvs.vendorID, cvs.StatusCode, c.VendorPoolID, count(*)
from com.CompanyVendorStatus cvs
join com.Company c on c.CompanyID = cvs.CompanyID
where cvs.VendorID = 10679
group by cvs.VendorID, cvs.StatusCode, c.VendorPoolID
order by count(*) desc

select v.VendorID, v.VendorName, v.StatusCode, cvs.StatusCode, c.CompanyID, c.CompanyName, c.VendorPoolID
from vnd.Vendor v
join com.CompanyVendorStatus cvs on cvs.VendorID = v.VendorID
join com.Company c on c.CompanyID = cvs.CompanyID
where v.VendorID = 10679

select *
from vnd.vendorpoolStatus vps
where vps.VendorPoolID = 64 and vps.VendorID = 10681

select *
from com.CompanyVendorStatus cvs
join com.Company c on c.CompanyID = cvs.CompanyID
where cvs.VendorID = 10681
	and c.VendorPoolID = 64

Declare	@vendorID INT = 10681,
		@vendorPoolID INT = 64,
		@statusCodeList VARCHAR(1000) = 'ACTIVE',
		@rowCount int

	SELECT @rowCount = COUNT(*) 
	FROM com.CompanyVendorStatus cvs
	JOIN vnd.Vendor v ON v.VendorID = cvs.VendorID
	INNER JOIN com.Company c ON c.CompanyID = cvs.CompanyID
	WHERE 
	cvs.VendorID = @vendorID 
	AND (@statusCodeList IS NULL OR cvs.StatusCode IN (SELECT VCValue FROM dbo.fnCsvToVC(@statusCodeList)))
	AND (@vendorPoolID IS NULL OR c.VendorPoolID = @vendorPoolID)
	AND v.IsMergeExclude = 0

	select @rowCount

Declare	@statusCodeList VARCHAR(1000) = 'ACTIVE'
		
	SELECT cvs.VendorID, cvs.StatusCode, v.VendorName, c.VendorPoolID, c.CompanyName
	FROM com.CompanyVendorStatus cvs
	JOIN vnd.Vendor v ON v.VendorID = cvs.VendorID
	INNER JOIN com.Company c ON c.CompanyID = cvs.CompanyID
	WHERE 
	cvs.VendorID in (10742,5455,10562,10321)
	and (@statusCodeList IS NULL OR cvs.StatusCode IN (SELECT VCValue FROM dbo.fnCsvToVC(@statusCodeList)))
	--AND (@vendorPoolID IS NULL OR c.VendorPoolID = @vendorPoolID)
	AND v.IsMergeExclude = 0
	order by cvs.VendorID, c.VendorPoolID
	
