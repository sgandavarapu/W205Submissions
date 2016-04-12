drop table Surveys;
create table Surveys
as select hID, cast((baseScore+consistencyScore) as int)as TotScore
from surveys_responses_all;
