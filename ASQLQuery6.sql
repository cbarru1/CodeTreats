select e.EmailID, e.CreateDate,
	m.MessageID, m.MessageTypeCode, 
	c.CompanyID, c.ExternalID, 
	u.UserID, u.UserName, 
	e.Body,
	em.EventID, brh.BidID, brh.BidNumber,
	vu.VendorUserID, vu.VendorID, vu.UserName
from eml.email e with(nolock)
join msg.Message m with(nolock) on m.MessageID = e.MessageID
left join com.Company c with(nolock) on c.CompanyID = m.CompanyID
left join evt.EventMessage em with(nolock) on em.MessageID = m.MessageID
left join dbo.Bid_BidRequestHeader brh with(nolock) on brh.NewBidID = em.EventID
left join msg.MessageRecipient mr with(nolock) on mr.MessageID = m.MessageID
left join com.[user] u with(nolock) on u.UserID = mr.UserID
left join vnd.VendorUser vu with(nolock) on vu.VendorUserID = mr.VendorUserID
--left join eva.CompanyEvaluator ce with(nolock) on ce.CompanyID = m.CompanyID and ce.UserID = u.UserID
--left join eva.Evaluator etor with(nolock) on etor.CompanyEvaluatorID = ce.CompanyEvaluatorID
--left join eva.EvaluationEvaluator eetor with(nolock) on eetor.EvaluatorID = etor.EvaluatorID
where e.CreateDate > '06/26/2023' and e.StatusCode = 'ERROR' and m.MessageTypeCode = 'EVALRESETPASSWORDBYREQUEST'
order by e.CreateDate desc