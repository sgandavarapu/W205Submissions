drop table Score;
create table Score
as 
SELECT A.hID,A.mID, nvl(A.carescore,0) as score
FROM Effective_care A
UNION ALL
SELECT  B.hID,B.mID, nvl(B.re_ad_score,0) as score
FROM readmissions B;
