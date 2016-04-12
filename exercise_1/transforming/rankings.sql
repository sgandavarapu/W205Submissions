
drop table rankings;
create table rankings 
as
select hID, mID,score,percent_rank() over(partition by mID order by score DESC) AS perc_rank 
from Score
where mID not in ("OP_18b", "OP_5", "OP_3b", "OP_1","ED_1b","ED_2b","EDV")
and score>0
UNION ALL
select hID,mID,score, 1-percent_rank() over(partition by mID order by score ASC) AS perc_rank 
from Score
where mID in ("OP_18b", "OP_5", "OP_3b", "OP_1","ED_1b","ED_2b")
and score>0;
