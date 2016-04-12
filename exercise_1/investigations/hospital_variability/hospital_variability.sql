Highest variability;
select R.hID, h.hName,h.hState, stddev(R.perc_rank) as std_rank,count(R.perc_rank) as num_measures
FROM rankings R
join Hospitals h
on (h.hID = R.hID)
group by R.hID, h.hName,h.hState
having num_measures > 50
order by std_rank DESC;

Lowest variability;
select R.hID, h.hName,h.hState, stddev(R.perc_rank) as std_rank,count(R.perc_rank) as num_measures
FROM rankings R
join Hospitals h
on (h.hID = R.hID)
group by R.hID, h.hName,h.hState
having num_measures > 50
order by std_rank ASC;
