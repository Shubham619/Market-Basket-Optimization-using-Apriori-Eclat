

library(arules)
library(arulesViz)
products = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
products = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)

print(products@itemInfo)

products@itemInfo

products@data

itemFrequencyPlot(products,topN=10)

summary(products)

print(items.density) 

itemFrequencyPlot(products)


itemFrequencyPlot(products, topN=5)

itemFrequencyPlot(products, support = 0.1)

products.apriori <- apriori(products, parameter=list(support=0.01, confidence = 0.3,  minlen=2, maxlen =5))

summary(products.apriori)


inspect(products.apriori)

inspect(sort(products.apriori, by="support")[1:10])


inspect(sort(products.apriori, by=c("support","confidence"))[1:10])

inspect(sort(products.apriori, by="lift")[1:5])

subset.matrix <- is.subset(products.apriori, products.apriori)
redundant <- colSums(subset.matrix, na.rm=T) >= 1
which(redundant)


summary(products)
products.apriori.mineral_water <- apriori(products, parameter=list(support=0.01, confidence = 0.1,  minlen=2, maxlen =5),
                                     appearance = list(rhs=c("mineral water"), default = "lhs"))

inspect(sort(products.apriori.mineral_water, by="lift"))

plot(products.apriori.magazine,method="graph",control = list(type="itemsets"))


products.eclat <- eclat(products, parameter=list(support=0.003,  minlen=2, maxlen =5))

summary(products.eclat)

inspect(sort(products.eclat,by='support')[1:10])

plot(products.eclat,method = "graph")

