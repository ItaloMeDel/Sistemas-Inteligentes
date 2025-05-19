import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix

df = pd.read_csv('SI_L07_SVM_DATASET.csv', encoding='latin-1')
print(df)

sns.pairplot(df, hue="Continent", diag_kind="kde")
plt.show()

df["Country"] = df["Country"].apply(lambda x: sum(ord(c) for c in str(x)))
df["Continent"] = df["Continent"].apply(lambda x: sum(ord(c) for c in str(x)))

X = df[["Female Life", "Male Life"]]
y = df["Continent"]
print(X)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=20, random_state=3300)

modelo = SVC(kernel='rbf', C=373, gamma='scale')
modelo.fit(X_train, y_train)

y_pred = modelo.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
print(f"Precisión del modelo: {accuracy:.2f}")
print("\nReporte de Clasificación:\n", classification_report(y_test, y_pred))

cm = confusion_matrix(y_test, y_pred)
print(cm)

