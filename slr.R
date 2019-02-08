# Data Preprocessing Template

# Importing the datasets
dataset = read.csv('Salary_Data.csv')


library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#linear regression on training set

lr = lm(formula = Salary ~ YearsExperience, data = training_set)

#predict
y_predict = predict(lr, newdata = test_set)

#visualize
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour='red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(lr, newdata = training_set)), 
            colour = 'blue') +
  ggtitle('Salary vs experience') +
  xlab('yearsofexp') +
  ylab('salary')
#testset
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour='red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(lr, newdata = training_set)), 
            colour = 'blue') +
  ggtitle('Salary vs experience') +
  xlab('yearsofexp') +
  ylab('salary')