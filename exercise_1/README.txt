Initial data download and setup

mount -t ext4 /dev/xvdf /data 
cd /data 
mkdir hospital_compare 

#download and unzip data
wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip 
unzip /Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary 

# Run Bash/SQL in each of the three folders as specified in the exercise guidelines

#.txt files provided in investigations folder to explain approach and display query answers.