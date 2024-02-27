
# load csv data
import pandas as pd
data = pd.read_csv('Student_Performance.csv')

#reduce data to 300 rows
data = data.head(1000)

#convert binary variable to numerical and remove columnd Date
data['Extracurricular_Activities'] = data['Extracurricular_Activities'].map({'Yes': 1, 'No': 0})
data = data.drop('Date', axis=1)

# if Performance_Index > 50 , Yes, else No
data['Performance_Index'] = data['Performance_Index'].apply(lambda x: 'Yes' if x > 50 else 'No')

#split into train and test
from sklearn.model_selection import train_test_split
train, test = train_test_split(data, test_size=0.2)

#apply random forest to train data
from sklearn.ensemble import RandomForestClassifier
rf = RandomForestClassifier(n_estimators=100)

# train random fores tto predict Performance_Index using all variables except Date
rf.fit(train[['Hours_Studied', 'Previous_Scores', 'Extracurricular_Activities', 'Sleep_Hours', 'Sample_Question_Papers_Practiced']], train['Performance_Index'])
#predict on test data
predictions = rf.predict(test[['Hours_Studied', 'Previous_Scores', 'Extracurricular_Activities', 'Sleep_Hours', 'Sample_Question_Papers_Practiced']])
#accuracy
from sklearn.metrics import accuracy_score
accuracy = accuracy_score(test['Performance_Index'], predictions)
print('Accuracy:', accuracy)
