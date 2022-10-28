Rapport du projet ![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.001.jpeg)

Prix de l’immobilier 

Analyse exploratoire de données 

**Année universitaire :** 2021/22 

**Encadré par :** Mr. Aziz OUAARAB 

**Réalisé par :** Mohamed El Amine CHAFIKI & Younes IDHAMOU

1 

Demandez à un acheteur de maison de décrire la maison de ses rêves, et il ne commencera probablement pas par la hauteur du plafond du sous-sol ou la proximité d'une voie ferrée est-ouest. Mais l'ensemble de données de ce concours de terrain de jeu prouve que  beaucoup  plus  influence  les  négociations  de  prix  que  le nombre de chambres ou une clôture blanche. 

Avec 79 variables explicatives décrivant (presque) tous les aspects des maisons résidentielles à Iowa en Etats Unis, on va explorer ces données et essayer d’analyser et de savoir quels sont les variables qui sont les plus importants et qui influencent le plus les prix des maisons. 

Dans ce projet, on va utiliser le jeu de données train.csv issu du lien suivant : 

*https://www.kaggle.com/competitions/house-prices-advanced- regression-techniques/data* 

**ANOVA**

**Aperçu** 

Après le nettoyage 

Il existe 1460 instances de données. Le nombre total d’attributs est égal à 76, dont 38 sont qualitatives, 35 sont quantitatives + Id + salePrice 

**Application de la méthode ANOVA** 

Etant donné que les p-values résultantes de la méthode ANOVA sont très petites. Alors on ne peut pas les présenter dans un schéma et pour cela, on a choisi de calculer la disparité qui se calcule de la façon suivante : log(1/pval) Cette  valeur  est  inversement  proportionnelle  à  les  p-valeurs  et  simple  à interpréter. 

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.002.png)

**Interprétation :** 

D’après les plots précédents, on peut juger que certaines catégories (variables qualitatives) semblent plus diversifiées par rapport à SalePrice que d'autres. 

Pour chaque variable, les prix de vente sont partitionnés en ensembles distincts en fonction des valeurs de catégorie. 

Vérifions ensuite avec le test ANOVA si les ensembles ont des distributions similaires. Si la variable a un impact mineur, les moyennes définies doivent être égales. La diminution de pval est le signe d'une diversité croissante dans les partitions. 

Le quartier (Neighborhood), la qualité des matériaux à l’extérieur (ExterQual), la hauteur du sous-sol (BsmtQual) et la qualité de la cuisine (KitchenQual),  sont les variables qui ont les plus grands effets sur le prix de la maison. 

Dans la partie suivante, on va appliquer ACP pour réduire les données 

**ACP** 

36 est un grand nombre de variables quantitatives, alors on doit d’abord choisir les variables à inclure dans l’ACP, pour faire ça on doit identifier les variables les plus importantes ?

**ANOVA pour les modalités quantitatives**

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.003.png)

**Interprétation :**

On voit que les variables les plus importants dans ce jeu de données sont : 

*OverallQual  YearBuilt  YearRemodAdd GarageCars  GrLivArea  LotFrontage GarageArea  Fireplaces  X1stFlrSF FullBath  TotalBsmtSF* 

*TotRmsAbvGrd  MSSubClass* 

Maintenant on va exclure les variables qui sont fortement corrélés entre eux 

**Calcul des corrélations** 

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.004.png)

On reste avec 8 variables :  

[‘OverallQual’,’GarageArea’,’FullBath’,’X1stFlrSF’,’TotalBsmtSF’,’LotFrontage’,’BsmtFinSF1’ ,’GrLivArea’] 

La variable MSSubClass doit être supprimé car c’est une variable catégorique Maintenant on va appliquer la méthode ACP 

`  `**Note** 

Dans cette partie on va utiliser le logiciel RStudio 


**Application de la méthode ACP** 

**Observation des individus extrêmes** 

L’analyse des graphes ne révèle aucun individu singulier. 

**Distribution de l’inertie** 

L’inertie des axes factoriels indique d’une part si les variables sont structurées  et  suggère  d’autre  part  le  nombre  judicieux  de composantes principales à étudier. 

Les 2 premiers axes de l’analyse expriment **66.01%** de l’inertie totale du jeu de données  ;  cela  signifie  que  66.01%  de  la  variabilité  totale  du  nuage  des variables est représentée dans ce plan. C’est un pourcentage assez important, et le premier plan représente donc convenablement la variabilité contenue dans une grande part du jeu de données actif. Cette valeur est nettement supérieure à la valeur référence de **27.88%**, la variabilité expliquée par ce plan est donc hautement significative. 

Du  fait  de  ces  observations,  c’est  préférable  d’interpréter  les  dimensions supérieure ou égale à la troisième. 

**Représentation graphique** 

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.005.jpeg)

**Interprétation** 

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.006.png)

On remarque que les 2 premières dimensions ne rendent compte que de 74% de la variance totale 

Tant que les 5 premières dimensions redent compte de 90,56% de la variance totale. 

Ce qui veut dire que les 8 variables peuvent être remplacés par les 5 premières composantes tout en préservant la quasi-totalité de l’information 

**Le score des 10 premiers individus :** 

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.007.png)

Maintenant on a un nouveau jeu de données avec ces modalités  


**Régression multiple** 

Pour étudier la relation entre le prix de vente et les variables explicatives Dim1, Dim2, Dim3, Dim4 et Dim5 

`  `**Note** 

Ici va utiliser que les 100 premiers individus 

**Visualisation graphique de régression** 

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.008.jpeg)

**Graphe des résidus** 

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.009.jpeg)

**Le modèle** 

![](Aspose.Words.85108eee-c6e4-4c45-a20e-44388fc86b7c.010.png)

**Interprétation :** 

On peut voir que la valeur p de la statistique F est < 2.2e-16 qui est hautement significatif 

Cela signifie qu'au moins une des variables prédictives est significativement liée à la variable réponse 

On  peut  aussi  voir  que  les  changements  de  Dim1  sont  significativement associés aux changements de prix des ventes, Dim2, 3 et 4 ne sont pas très significatives tant que Dim5 n'est pas significative 

**Évaluation de la précision du modèle :** 

Le modèle explique 80% de la variance de la variable réponse Erreur standard résiduelle : 0.1828044 

**Equation de modèle :**  

*SalePrice = 180003 + 32031\*Dim1 - 8684\*Dim2 - 4132\*Dim3 + 11031\*Dim4*  

*+ 1570\*Dim5* 
