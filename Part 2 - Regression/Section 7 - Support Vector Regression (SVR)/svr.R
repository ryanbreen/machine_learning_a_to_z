# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Create regressor
#poly_reg = lm(formula = Salary ~ ., data = dataset)
#install.packages('e1071')
library(e1071)
reg = svm(formula = Salary ~ ., data = dataset, type = 'eps-regression')

# Predict svr
y_poly = predict(reg, data.frame(Level = 6.5))

# Visualize svr

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)

library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = x_grid, y = predict(reg, newdata = data.frame(Level = x_grid))), color = 'blue') +
  ggtitle('Truth or Bluff (Regressor)') +
  xlab('Level') +
  ylab('Salary')
