import psycopg2
import sys

def results_1(word):

	conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
	cur = conn.cursor()
	qry="SELECT word, count from Tweetwordcount where word = '" + word + "';"
	cur.execute(qry)
	records = cur.fetchall()
	for rec in records:
		print "The total number of occurences of '", rec[0] , "':", rec[1], "\n"
	conn.commit()
	conn.close()

def results_2():

        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()
        qry="SELECT word, count from Tweetwordcount order by UPPER(word);"
        cur.execute(qry)
        records = cur.fetchall()
        for rec in records:
                print  "(",rec[0] , ":", rec[1],")"
        conn.commit()
        conn.close()


if __name__ == "__main__":
	try:
		word=sys.argv[1]
		results_1(word)
	except:
		results_2()
