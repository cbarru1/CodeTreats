DROP TABLE #tempTable;  

select v.VendorID into #tempTable
from vnd.vendor v
join vnd.VendorPoolStatus vps on vps.VendorID = v.VendorID
where vps.VendorPoolID = 1000

select v.VendorID, v.VendorName, v.StatusCode, vu.UserName, vu.FirstName, vu.StatusCode, vps.VendorPoolID, vps.StatusCode, c.externalID
from vnd.vendor v
join vnd.VendorUser vu on vu.VendorID = v.VendorID
join vnd.VendorPoolStatus vps on vps.VendorID = v.VendorID
join com.CompanyVendorStatus cvs on cvs.vendorid = v.VendorID
join com.Company c on c.CompanyID = cvs.CompanyID
where v.vendorID not in (select * from #tempTable) 
and v.VendorID != 10432 -- big giant vendor with tons of vendorUsers
and vps.StatusCode = 'ACTIVE'
order by VendorName desc


select v.*
from vnd.Vendor v
left join vnd.VendorPoolStatus vps on vps.VendorID = v.VendorID and vps.VendorPoolID = 1000
where vps.VendorPoolStatusID is null


select *
from vnd.vendor v
join vnd.VendorUser vu on vu.VendorID = v.VendorID
where vu.UserName = 'bwcmbid'

select *
from vnd.Vendor v
where v.VendorID = 10326

select v.vendorID, v.vendorName, v.IsOffline, v.StatusCode, cvs.StatusCode, vps.StatusCode
from vnd.vendor v
--join vnd.VendorUser vu on vu.VendorID = v.VendorID
join com.CompanyVendorStatus cvs on cvs.vendorID = v.VendorID
join vnd.VendorPoolStatus vps on vps.VendorID = v.VendorID
where v.VendorID = 10748

select v.vendorID, v.vendorName, v.IsOffline, v.StatusCode as VStatusCode, 
cvs.CompanyVendorStatusID, cvs.StatusCode as CVSStatusCode, 
vps.VendorPoolID, vps.VendorPoolStatusID, vps.StatusCode as VPSStatusCode, cvs.CompanyID
from vnd.vendor v
--join vnd.VendorUser vu on vu.VendorID = v.VendorID
join com.CompanyVendorStatus cvs on cvs.vendorID = v.VendorID -- and cvs.CompanyID = 1
join vnd.VendorPoolStatus vps on vps.VendorID = v.VendorID
where v.VendorID = 3089

--72 rows.  wait until tomorrow to be sure that none got deleted.

select *
from com.Company c
where c.CompanyName like '%Blue Valley%'

--companyID for Blue Valley = 151

select *
from vnd.VendorUser vu
join vnd.Vendor v on v.VendorID = vu.VendorID
where v.VendorID = 3089

--