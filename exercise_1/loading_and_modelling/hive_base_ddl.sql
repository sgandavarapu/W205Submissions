DROP TABLE hospitals_all;
CREATE EXTERNAL TABLE hospitals_all
(hID string, hName string, hAddress string, hCity string,hState string, 
hZIP string, hCounty string,hPhone string,hType string, hOwnership string,emergencyServices string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" =
'"', "escapeChar" = '\\') 
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';


DROP TABLE effective_care_all;
CREATE EXTERNAL TABLE effective_care_all
(hID string, hName string, hAddress string, hCity string,
hState string,
hZIP string, hCounty string, hPhone string, condition string, mID string,
mName string,
mscore int, msample int, mfootnote string, mStartDate
string, mEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" =
'"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';


DROP TABLE measures_all;
CREATE EXTERNAL TABLE measures_all
(mName string, mID string, mStartQuarter string, mStartDate
string, mEndQuarter string, mEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" =
'"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/Measures';

DROP TABLE readmissions_all;
CREATE EXTERNAL TABLE readmissions_all
(hID string, hName string, hAddress string, hCity string,
hState string, hZIP string, hCounty string, hPhone string,
mName string, mID string,
comparedToNational string, denominator string, score float,
lowEst float, highEst float, footnote string,
mStartDate string, mEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" =
'"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE surveys_responses_all;
CREATE EXTERNAL TABLE surveys_responses_all
(hID string, hName string, hAddress string, hCity string,
hState string, hZIP string, hCounty string, nurseAP string,
nurseIP string, nurseDS string,
doctorAP string, doctorIP string, doctorDS string, staffAP
string, staffIP string, staffDS string, painAP string, painIP
string, painDS string,
medicineAP string, medicineIP string, medicineDS string,
environmentAP string, environmentIP string, environmentDS
string,
dischargeAP string, dischargeIP string, dischargeDS string,
overallhAP string, overallhIP string, overallhDS string, baseScore
string,
consistencyScore string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "quoteChar" =
'"', "escapeChar" = '\\')
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses';

