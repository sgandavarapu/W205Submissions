# Exercise 2: Instructions to Run the Program

1.	This project is run using the Amazon EC2 instance using the community AMI (UCB Spring 2016).
2.	Here are the steps to recreate the results:
3.	First, postgres needs to be started using the following command:
sudo -u postgres pg_ctl -D /data/pgsql/data -l /data/pgsql/logs/pgsql.log start
4.	Then, we need to create empty database and empty table for collection of tweets: 
su - postgres;
psql;
CREATE DATABASE tcount;
\c tcount;
CREATE TABLE tweetwordcount(word TEXT PRIMARY KEY NOT NULL, count INT NOT NULL);
5.	Download the github repository to the EC2 instance.
6.	cd to the exercise home directory
7.	 The twitter project can be started by using the command "sparse run -n tweetwordcount"
8.	After letting the twitter stream run for a few minutes, you can terminate the program by ctrl+c.
9.	Now, the database must be populated with all words in twitter stream and their counts. The serving scripts can be run now to see the specific results.
10.	For example, cd src/serve/ and then run "python final_resultsts.py" shows all the words and their corresponding counts. "python plot_top20.py" shows the histogram of counts of the top 20 words.
 

