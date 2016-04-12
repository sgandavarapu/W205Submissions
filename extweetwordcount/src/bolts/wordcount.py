from __future__ import absolute_import, print_function, unicode_literals
import psycopg2
from collections import Counter
from streamparse.bolt import Bolt



class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()
	cur.execute('''DELETE FROM tweetwordcount''')
	conn.commit()
	conn.close()
#self.redis = StrictRedis()

    def process(self, tup):
        word = tup.values[0].replace("'","").replace("`","").replace(".","")


        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        #Save to table
	conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()
	if self.counts[word] == 1: #First time word appears
		qry = "INSERT INTO Tweetwordcount (word,count) VALUES ('" + word + "', 1);"
		cur.execute(qry)
		conn.commit()
	else:
		cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word=%s;",(self.counts[word],word))
		conn.commit()
	
	# Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
	self.log(tup)
	
