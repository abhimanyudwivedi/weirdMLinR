#import
library(arules)
#dataset = read.csv('Market_Basket_Optimisation.csv')
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)

itemFrequencyPlot(dataset, topN = 10)

#train
rules = eclat(data = dataset, parameter = list(support = 0.004, minlen = 2))

#visualize
inspect(sort(rules, by = 'support')[1:10])
