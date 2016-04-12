import psycopg2
import sys

def results(low,high):

	conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
	cur = conn.cursor()
	qry="SELECT word, count from Tweetwordcount where count BETWEEN " + low + " and " + high + ";"
	cur.execute(qry)
	records = cur.fetchall()
	for rec in records:
		print rec[0] , ":", rec[1]
	conn.commit()
	conn.close()

if __name__ == "__main__":
	try:
		range=sys.argv[1].split(",")
		low = range[0]
		high=range[1]
		results(low,high)
	except:
		print "This Script Expects two integer arguments separated by a comma"
