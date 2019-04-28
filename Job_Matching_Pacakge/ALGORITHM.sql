With ranked_records AS
(
select *,
ROW_NUMBER() OVER(Partition By  substring([Job Ad],0,10),Company,Competitorname, industry, [work location], [job specialization] ,[salary range]
Order By company) [ranked]
from Acutual_Data$
)
select Company,[Job Ad],CompetitorName,industry,[work location],[job specialization],[applicants received],[salary range]
 from ranked_records
where ranked > 1 