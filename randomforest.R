# Chargement de la librairie
install.packages("randomForest")
install.packages("plotly")
library(randomForest)
library(plotly)
library(ggplot2)

# Chargement des données 
data(iris)
View(iris)

# description des données 
summary(iris)

plot_ly (x=iris$Sepal.Length, type = "histogram") 
plot_ly (x=iris$Sepal.Width, type = "histogram") 
plot_ly (x=iris$Petal.Length,type = "histogram") 
plot_ly (x=iris$Petal.Width, type = "histogram")

?randomForest

# Algorithme Random Forest  
iris_RandomForest <- randomForest(Species~.,data=iris, ntree = 100, 
                                  mtry = 2, na.action = na.roughfix)

# Affichons les résultats de l’algorithme, on y retrouve :

# Les paramètres du modèle Number of trees=ntree et No. of variables
# tried at each split=mtry

#L’erreur Out Of Bag qui est utilisée pour mesurer la performance
# des modèles d’agrégation. Il s’agit de l’erreur moyenne calculée,
# a chaque fois, sur les échantillons qui n’ont pas servis à calculer
# le modèle.

#La matrice de confusion qui permet d’avoir une vision plus detaillee de
# la performance du modèle. On peut lire en ligne les valeurs re
# elles et en colonne les valeurs prédites par l’algorithme. 
# Ainsi, les valeurs sur la diagonale correspondent à de bonnes 
# predictions tandis que les autres valeurs ont mal été prédites. 

#Ici, on voit par exemple que 5 Virginicas ont été prédites comme
# étant des Versicolors.

# Résultats de l'algoritme
print(iris_RandomForest)

#Si besoin, on optimise le modèle
#  pouvez maintenant modifier les paramètres de l’algorithme pour 
# essayer de diminuer l’Out Of Bag error. Vous pouvez modifier à 
# la main les paramètres pour améliorer le modèle ou utiliser la 
# methode Grid Search. Une fois que les résultats conviennent, 
# nous allons pouvoir expliciter un peu plus l’algorithme pour être
# en mesure de l’expliquer.

# On restitue les résultats

# Que serons nous en mesure de donner / d’expliquer aux futurs utilisateurs 
# du modèle ?

#L’importance des variables dans le modele, pour cela nous allons 
# utiliser l’indice Mean Decrease Gini. Plus cet indicateur est eleve
# plus la variable est importante dans le modele 
# (il mesure la diminution de l’indice de Gini si l’on n’intégrait 
# plus cette variable dans le modèle)

#Le lien entre les variables les plus importantes et la variable
# à prédire
# La performance du modèle avec la matrice de confusion qui est 
# plus détaillée que l’Out Of Bar error.

#Variables d'importance 
iris_RandomForest$importance[order(iris_RandomForest$importance[, 1], 
                                   decreasing = TRUE), ]

# Impact de Petal.Length et de Petal.Width sur Species
plot_ly(data = iris, x = ~Species, y = ~Petal.Length, type ='bar')
plot_ly(data = iris, x = ~Species, y = ~Petal.Width,type ='bar')

