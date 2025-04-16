--select *
--from com.company c with(nolock)
--where c.externalID = 'spsebids'

----companyID = 201

--select *
--from dbo.Bid_BidRequestHeader brh with(nolock)
--where brh.CompanyID = 201 and brh.BidNumber like '%25-047%'

----bidID = 1383
----newBidID = 308678

--select *
--from eva.EvaluationHeader eh with(nolock)
--where eh.EventID = 308678

--select top(100) *
--from ctl.BatchProcess bp with(nolock)
--join ctl.BatchProcessStep bps with(nolock) on bps.BatchProcessID = bp.BatchProcessID
--where bp.BatchProcessTypeCode = 'SCOREBYEVAL'
--order by bp.BatchProcessID desc

--select 'ItemScore',*
--from eva.ItemScore iscore
--with(nolock)
--where charindex(CHAR(0x02), iscore.Notes, 0) > 0

--select iscore.Notes
--from eva.ItemScore iscore with(nolock)
--join eva.ScoringCriteriaItem sci with(nolock) on sci.ScoringCriteriaItemID = iscore.ScoringCriteriaItemID
--where iscore.ItemScoreID = 1258832 and iscore.EvaluatorID = 43895


--select top(100) *
--from aud.ErrorLog el with(nolock)
--order by el.ErrorLogID desc

--select *
--from eva.EvaluationVendor ev with(nolock)
--where ev.EvaluationVendorID = 89317

--select *
--from vnd.Vendor v with(nolock)
--where v.vendorid = 1079661

Begin Tran

update eva.ItemScore 
set Notes = 
(SELECT REPLACE((select iscore.Notes
from eva.ItemScore iscore with(nolock)
where iscore.ItemScoreID = 1258832 and iscore.EvaluatorID = 43895), CHAR(2), ''))
where ItemScoreID = 1258832 and EvaluatorID = 43895

select iscore.Notes
from eva.ItemScore iscore with(nolock)
where iscore.ItemScoreID = 1258832 and iscore.EvaluatorID = 43895

--commit tran
--rollback tran
