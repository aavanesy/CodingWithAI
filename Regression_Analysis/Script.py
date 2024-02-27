
#load the csv
import pandas as pd
data = pd.read_csv('Student_Performance.csv')

#names data
data.columns


# compute an OLS model to explain Performance_Index
import statsmodels.api as sm
X = data[['Hours_Studied']]
X = sm.add_constant(X)
y = data['Performance_Index']
model = sm.OLS(y, X).fit()

model.summary()

person_A = 20
predicted_performance_index = model.predict([1, person_A])  # Predicting for 10 hours studied

print("Predicted Performance Index for studying 10 hours:", predicted_performance_index[0])


# CHATGPT
import pandas as pd
import statsmodels.api as sm

# Creating a DataFrame from the given data

df = data

# Converting 'Extracurricular_Activities' to numerical values (Yes: 1, No: 0)
df['Extracurricular_Activities'] = df['Extracurricular_Activities'].map({'Yes': 1, 'No': 0})

# Adding a constant term for the intercept
X = sm.add_constant(df[['Hours_Studied', 'Previous_Scores', 'Extracurricular_Activities', 'Sleep_Hours', 'Sample_Question_Papers_Practiced']])
y = df['Performance_Index']

# Performing OLS (Ordinary Least Squares) regression
model = sm.OLS(y, X).fit()

# Printing the regression summary
print(model.summary())



