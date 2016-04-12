import psycopg2
import sys
import matplotlib.pyplot as plt
import numpy as np

def plot_hist():
	x =[]
	y = []
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()
        qry="SELECT * from Tweetwordcount order by count desc limit 20;"
        cur.execute(qry)
        records = cur.fetchall()
	l = len(records)
        for rec in records:
		word=rec[0].replace("'","")
                x.append(str(word))
		y.append(int(rec[1]))
        conn.commit()
        conn.close()
	z = np.arange(len(records))
	plt.bar(z,y)
	plt.xticks(z+0.5,x,rotation=90)
	plt.title("Top 20 Words in Twitter feed")
	plt.xlabel("Words")
	plt.ylabel("Frequency")
	plt.savefig('top20.png',bbox_inches='tight',pad_inches=1.0)


if __name__ == "__main__":
	plot_hist()
