dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

lr = lm(formula = Salary ~ .,
        data = dataset)

summary(lr)

dataset$Level2 = (dataset$Level)^2
dataset$Level3 = (dataset$Level)^3
dataset$Level4 = (dataset$Level)^4

poly_reg = lm(formula = Salary ~ .,
              data = dataset)

library(ggplot2)
ggplot() + 
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             colour='red') +
  geom_line(aes(x=dataset$Level, y=predict(lr, newdata=dataset)),
            colour='blue') + 
  ggtitle('Truth or bluff') + 
  xlab('level') +
  ylab('salary')

ggplot() + 
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             colour='red') +
  geom_line(aes(x=dataset$Level, y=predict(poly_reg, newdata=dataset)),
            colour='blue') + 
  ggtitle('Truth or bluff') + 
  xlab('level') +
  ylab('salary')


y_pred = predict(lr, newdata = 6.5)