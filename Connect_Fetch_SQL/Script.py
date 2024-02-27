
# load necessary lib to connect to mysql
import mysql.connector

#connect to mysql
conn = mysql.connector.connect(
    host='localhost',
    user='user_one',
    password='1122',
    database='mydata')

#verify if valid
conn.is_connected()

# check tables in the database
cursor = conn.cursor()
cursor.execute('show tables')
cursor.fetchall()

# create a dummy table with random data on aircrafts and their max speed
data = {'Aircraft': ['F-16', 'F-22', 'F-35', 'F-15', 'F-18'],'Max_Speed': [1500, 1550, 1600, 1450, 1400]}

# upload the data to mysql server
import pandas as pd
df = pd.DataFrame(data)
df.to_sql(name='aircraft_speed', con=conn, if_exists='replace', index=False)


# using another option, not pandas
cursor.execute('create table aircraft_speed (Aircraft varchar(10), Max_Speed int)')

# insert data into the table
cursor.execute('insert into aircraft_speed values ("F-16", 1500), ("F-22", 1550), ("F-35", 1600), ("F-15", 1450), ("F-18", 1400)')

# load only F-16 data
dff = pd.read_sql('select * from aircraft_speed where Aircraft = "F-16"', conn)
