select u.UserID, u.CompanyID, u.UserName, u.StatusCode, u.IsReceiveEmail, u.IsEmailSystemDisabled, u.EmailSystemDisableDate, be.EmailStatusCode
from eml.BulkEmail be with(nolock)
join msg.BulkMessageRecipient bmr with(nolock) on bmr.BulkMessageRecipientID = be.BulkMessageRecipientID
join msg.BulkMessage bm with(nolock) on bm.BulkMessageID = bmr.BulkMessageID
join com.[user] u with(nolock) on u.UserID = bmr.UserID
where u.StatusCode = 'ACTIVE' and u.IsEmailSystemDisabled = 1 and be.EmailStatusCode = 'DRAFT'
order by bmr.createdate desc

begin tran
update u
set u.IsReceiveEmail = 1, u.IsEmailSystemDisabled = 0, u.EmailSystemDisableDate = null
from msg.BulkMessageRecipient bmr with(nolock)
join com.[user] u with(nolock) on u.UserID = bmr.UserID
join eml.BulkEmail be with(nolock) on be.BulkMessageRecipientID = bmr.BulkMessageRecipientID
where u.StatusCode = 'ACTIVE' and u.IsEmailSystemDisabled = 1 and be.EmailStatusCode = 'DRAFT'
--commit tran
--rollback tran