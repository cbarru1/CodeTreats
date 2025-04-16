SELECT TOP (100) *
  FROM [PROC_PREV_TASK].[dbo].[Sys_Task]
  where TaskType in (115,116,117,118)
  order by createdate desc

update dbo.Sys_Task
set ScheduledDate = '2024-05-08 09:00:00.000', status = 'PEND'
where TaskID = 9763313 and TaskType = 118
