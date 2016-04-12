drop table readmissions;
create table readmissions
as select
hID,mID,cast(100-score as DOUBLE) as re_ad_score, cast((highEst - lowEst) as DOUBLE) as re_ad_scoreRange
from readmissions_all;

