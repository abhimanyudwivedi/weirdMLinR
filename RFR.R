# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#install.packages('randomForest')

library(randomForest)
set.seed(1234)
reg = randomForest(x = dataset[1],
                   y = dataset$Salary,
                   ntree = 500)


# Predicting a new result
y_pred = predict(reg, data.frame(Level = 6.5))

# Visualising the RFR results
# install.packages('ggplot2')
library(ggplot2)

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(reg, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (DTR)') +
  xlab('Level') +
  ylab('Salary')