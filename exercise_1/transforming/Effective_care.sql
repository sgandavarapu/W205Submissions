drop table Effective_care;
create table Effective_care
as select
hID,mID,cast(mscore as bigint) AS carescore,cast(msample as bigint) as caresample
from effective_care_all;
