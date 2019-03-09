# -*- coding: utf-8 -*-
#' """
#' Created on Sat Mar  9 16:51:55 2019
#' 
#' author: Abhimanyu_Dwivedi
#"""

#dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
#arules doesn't work with normal csv it needs a sparse matrix, hence transactions.
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
itemFrequencyPlot(dataset, topN = 100)

#using Apriori
#insatll arules
#install.packages('arules')
library(arules)

rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))

#visualize
inspect(sort(rules, by = 'lift')[1:10])
