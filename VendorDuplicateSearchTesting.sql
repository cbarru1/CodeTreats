declare @vendorID int = 9988  -- bubba
EXEC vnd.VendorDuplicateSearch @vendorID = @vendorID
,@excludeRegisteredWithSameCompany = 0

select *
from vnd.vendoruser vu
where vu.VendorUserID = 408411

select *
from vnd.vendoruser vu
where vu.VendorUserID in (409217,409218,409219)

--emailMatch
--vendorUser
--VendorAddress
--VendorRecoveryEmail

--phoneMatch
--vendor.phone
--vendor.fax
--vendorAddress - 3 phones
--vendorUser

select *
from vnd.VendorAddress va
where va.VendorAddressID in (9131,9132)
