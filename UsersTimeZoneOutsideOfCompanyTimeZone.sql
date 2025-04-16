select u.UserID, u.UserName, (u.LastName + ', ' + u.FirstName) as 'Name', u.TimeZoneID, tz1.Title,
c.CompanyID, c.ExternalID, c.CompanyName, c.TimeZoneID, tz.Title
from com.Company c with(nolock)
join com.[user] u with(nolock) on u.CompanyID = c.CompanyID
join app.TimeZone tz with(nolock) on tz.TimeZoneID = c.TimeZoneID
join app.TimeZone tz1 with(nolock) on tz1.TimeZoneID = u.TimeZoneID
where c.IsActive = 1 and 
	c.TimeZoneID = 1 and u.TimeZoneID not in (1, 2) or c.TimeZoneID = 2 and u.TimeZoneID not in (1, 2) or
	c.TimeZoneID = 3 and u.TimeZoneID not in (3, 4) or c.TimeZoneID = 4 and u.TimeZoneID not in (3, 4) or
	c.TimeZoneID = 5 and u.TimeZoneID not in (5, 6) or c.TimeZoneID = 6 and u.TimeZoneID not in (5, 6) or
	c.TimeZoneID = 7 and u.TimeZoneID not in (7, 8) or c.TimeZoneID = 8 and u.TimeZoneID not in (7, 8) or
	c.TimeZoneID = 9 and u.TimeZoneID not in (9, 10) or c.TimeZoneID = 10 and u.TimeZoneID not in (9, 10) or
	c.TimeZoneID = 11 and u.TimeZoneID not in (11, 12) or c.TimeZoneID = 12 and u.TimeZoneID not in (11, 12) or
	c.TimeZoneID = 13 and u.TimeZoneID not in (13, 14) or c.TimeZoneID = 14 and u.TimeZoneID not in (13, 14)