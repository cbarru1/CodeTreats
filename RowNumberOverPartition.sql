begin transaction

--Remove all dups with row number 2 or greater.  This will leave only one single row
;WITH cte AS (
  SELECT *,
     row_number() OVER(PARTITION BY ua.UserID, ua.message ORDER BY ua.UserID, ua.CreateDate DESC) AS [rn]
FROM aud.UserAudit ua
WHERE ua.createdate BETWEEN '2023-06-27 11:47:50' AND '2023-06-28 11:32:00'  -- later time includes the added "No" to "Yes" audits at fix time 11:31
	and ua.message like '%IsReceiveEmail is False%'
)
Delete from cte WHERE [rn] > 1

rollback transaction
--commit transaction

begin transaction
--update the remaining row with a new message.
--we don't really need the cte at this point, but it works well and will do the job
;WITH cte1 AS (
  SELECT *,
     row_number() OVER(PARTITION BY ua.UserID, ua.message ORDER BY ua.UserID, ua.CreateDate DESC) AS [rn]
FROM aud.UserAudit ua
WHERE ua.createdate BETWEEN '2023-06-27 11:47:50' AND '2023-06-28 11:32:00'  -- later time includes the added "No" to "Yes" audits at fix time 11:31
	and ua.message like '%IsReceiveEmail is False%'
)
update cte1
set [Message] = 'Email was system disabled.  IsReceiveEmail is False'

rollback transaction
--commit transaction