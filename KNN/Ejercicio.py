import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from sklearn.linear_model import LogisticRegression


data = pd.read_csv("/content/diabetes.csv")
print(data.head())

X = data.drop(columns=["Outcome"])
y = data["Outcome"]

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=7183)


scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)


k_values = range(60, 71)
accuracies = []
for k in k_values:
  knn = KNeighborsClassifier(n_neighbors=k)
  knn.fit(X_train, y_train)
  y_pred_k = knn.predict(X_test)
  accuracies.append(accuracy_score(y_test, y_pred_k))
  
  
plt.figure(figsize=(10, 5))
plt.plot(k_values, accuracies, marker='o', linestyle=':', color='r')
plt.xlabel("Número de Vecinos (K)")
plt.ylabel("Precisión del Modelo")
plt.title("Efecto del Número de Vecinos (K) en la Precisión de KNN")
plt.xticks(k_values)
plt.grid(True)
plt.show()

best_k = k_values[np.argmax(accuracies)]
print(f"El mejor valor de K encontrado: {best_k}")

knn_best = KNeighborsClassifier(n_neighbors=best_k)
knn_best.fit(X_train, y_train)

y_pred = knn_best.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
conf_matrix = confusion_matrix(y_test, y_pred)
class_report = classification_report(y_test, y_pred)
print(f'Precisión del modelo con K={best_k}: {accuracy:.5f}')
print("Matriz de Confusión:\n", conf_matrix)
print("Reporte de Clasificación:\n", class_report)




model = LogisticRegression()
model.fit(X_train, y_train)

y_pred = model.predict(X_test)

accuracy = accuracy_score(y_test, y_pred)
print(f'Exactitud del modelo: {accuracy:.5f}')

print("Matriz de Confusión:\n", confusion_matrix(y_test, y_pred))

class_report = classification_report(y_test, y_pred)
print("Reporte de Clasificación:\n", class_report)




# Importar librerías necesarias
import matplotlib.pyplot as plt
import seaborn as sns
# Crear el gráfico de dispersión
plt.figure(figsize=(8,5))
sns.scatterplot(x=data['Age'],
y=data['BloodPressure'],
hue=data['Outcome'],
palette='coolwarm',
alpha=0.7)
# Etiquetas y título
plt.xlabel("Edad")
plt.ylabel("Presión en Sangre")
plt.title("Gráfico de Dispersión: Edad vs Presión en Sangre")
plt.legend(title="Diabetes (0=No tiene, 1=Tiene)")
# Mostrar gráfico
plt.show()