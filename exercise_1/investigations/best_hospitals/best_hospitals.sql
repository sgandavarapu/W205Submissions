Select R.hID, h.hName,h.hState, avg(R.perc_rank) as avg_rank,count(R.perc_rank) as num_measures
FROM rankings R
join Hospitals h
on (h.hID = R.hID)
group by R.hID, h.hName,h.hState
having num_measures > 50
order by avg_rank DESC;
