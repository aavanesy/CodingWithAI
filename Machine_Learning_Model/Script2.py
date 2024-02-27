import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC
from xgboost import XGBClassifier
from sklearn.metrics import accuracy_score

# Create the dataset
data = pd.read_csv('Student_Performance.csv')
df = pd.DataFrame(data)

# Remove the "Date" column
df.drop(columns=['Date'], inplace=True)

# Convert Performance_Index to binary variable
df['Performance_Index'] = df['Performance_Index'].apply(lambda x: 1 if x >= 50 else 0)

# Convert Extracurricular_Activities to numeric
df['Extracurricular_Activities'] = df['Extracurricular_Activities'].map({'Yes': 1, 'No': 0})

# Split the data into features and target variable
X = df.drop("Performance_Index", axis=1)
y = df["Performance_Index"]

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train Random Forest model
rf_model = RandomForestClassifier(random_state=42)
rf_model.fit(X_train, y_train)

# Train Support Vector Machine model
svm_model = SVC(random_state=42)
svm_model.fit(X_train, y_train)

# Train XGBoost model
xgb_model = XGBClassifier(random_state=42)
xgb_model.fit(X_train, y_train)

# Make predictions
rf_pred = rf_model.predict(X_test)
svm_pred = svm_model.predict(X_test)
xgb_pred = xgb_model.predict(X_test)

# Calculate accuracy
rf_accuracy = accuracy_score(y_test, rf_pred)
svm_accuracy = accuracy_score(y_test, svm_pred)
xgb_accuracy = accuracy_score(y_test, xgb_pred)

# Compare accuracy
accuracy_df = pd.DataFrame({
    "Model": ["Random Forest", "Support Vector Machine", "XGBoost"],
    "Accuracy": [rf_accuracy, svm_accuracy, xgb_accuracy]})
print(accuracy_df)

