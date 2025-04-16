select *
from app.HomeTileType htt with(nolock)

select * 
from com.Company c with(nolock)
where c.ExternalID = 'nixa'

--companyID = 129

Declare	@companyID INT = 129

	SELECT *
	FROM [com].Map_Company_Module
	WHERE CompanyID = @companyID
	ORDER BY ModuleCode

select cc.*, cct.*
from com.CompanyCache cc with(nolock)
join app.CompanyCacheType cct with(nolock) on cct.CompanyCacheTypeID = cc.CompanyCacheTypeID
where cc.CompanyID = 129

select *
from com.UserCache uc with(nolock)
join app.UserCacheType uct with(nolock) on uct.UserCacheTypeID = uc.UserCacheTypeID
where uc.UserID = 6819

update com.UserCache 
set XmlData = '<Tiles />'
where UserCacheID = 2589

select *
from com.company c with(NOLOCK)
where c.ExternalID = 'pisd'
-- companyID = 4

select *
from com.UserCache uc with(nolock)
join com.[User] u with(nolock) on u.UserID = uc.UserID and u.CompanyID in (129, 4)
where uc.UserCacheTypeID = 2