With ranked_records AS
(
select *,
ROW_NUMBER() OVER(Partition By  ProductID
Order By OrderDate) [ranked]
from sales
)
select Country,City,State,Region,Category,SubCategory,ProductName,ProductID,OrderDate,Sales
 from ranked_records
where ranked = 1 

