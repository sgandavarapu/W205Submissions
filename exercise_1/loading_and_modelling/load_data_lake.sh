#!/bin/bash
# Strip Headers and Rename

tail -n+2 /data/hospital_compare/Hospital\ General\ Information.csv > /data/hospital_compare/hospitals.csv
tail -n+2 /data/hospital_compare/Timely\ and\ Effective\ Care\ -\ Hospital.csv > /data/hospital_compare/effective_care.csv
tail -n+2 /data/hospital_compare/Readmissions\ and\ Deaths\ -\ Hospital.csv > /data/hospital_compare/readmissions.csv
tail -n+2 /data/hospital_compare/Measure\ Dates.csv > /data/hospital_compare/Measures.csv
tail -n+2 /data/hospital_compare/hvbp_hcahps_05_28_2015.csv > /data/hospital_compare/surveys_responses.csv

# Load into hadoop data lake

hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses
hdfs dfs -put /data/hospital_compare/hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put /data/hospital_compare/effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put /data/hospital_compare/readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put /data/hospital_compare/Measures.csv /user/w205/hospital_compare/Measures
hdfs dfs -put /data/hospital_compare/surveys_responses.csv /user/w205/hospital_compare/surveys_responses
