#
# Libraries
#
import psycopg2, os

#
# Vars
#
pg_host = os.environ['POSTGRES_HOST']
pg_dbname = os.environ['POSTGRES_DB_NAME']
pg_user = os.environ['POSTGRES_USER']
pg_password = os.environ['POSTGRES_PASSWORD']

#
# Setup connection
#
conn_str = 'host=' + pg_host + ' dbname=' + pg_dbname + ' user=' + pg_user + ' password=' + pg_password
conn = psycopg2.connect(conn_str)
cur = conn.cursor()

#
# Get question
#
cur.execute('SELECT key, question, answer, sort FROM faq')
key = cur.fetchone()[0]

#
# Get answer
#
answer_path = os.getcwd() + '/../detail/faq/' + key + '.md'
answer_file = open(answer_path, 'r')
answer = answer_file.read()
answer_file.close()

#
# Update faq table
#
print('Loading FAQ answers')
cur.execute('UPDATE faq SET answer = %s', (answer,))
conn.commit()

#
# Close connection
#
cur.close()
conn.close()
