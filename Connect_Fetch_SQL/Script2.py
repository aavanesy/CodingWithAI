import pandas as pd
import numpy as np
import pymysql
from sqlalchemy import create_engine

# Generate random data for the DataFrame
np.random.seed(0)  # For reproducibility
data = {
    'A': np.random.randint(0, 100, size=100),
    'B': np.random.rand(100),
    'C': np.random.choice(['X', 'Y', 'Z'], size=100)
}

# Create a pandas DataFrame
df = pd.DataFrame(data)

# MySQL connection parameters
host = 'localhost'
user = 'user_one'
password = '1122'
database = 'mydata'

# Establish connection to MySQL database
engine = create_engine(f'mysql+pymysql://{user}:{password}@{host}/{database}')

# Upload DataFrame to MySQL database
df.to_sql('random_data', con=engine, if_exists='replace', index=False)


data = {'Aircraft': ['F-16', 'F-22', 'F-35', 'F-15', 'F-18'],'Max_Speed': [1500, 1550, 1600, 1450, 1400]}
import pandas as pd
df = pd.DataFrame(data)
df.to_sql(name='aircraft_speed', con=engine, if_exists='replace', index=False)

# load only F-16 data
dff = pd.read_sql('select * from aircraft_speed', conn)

# Close the connection
engine.dispose()
