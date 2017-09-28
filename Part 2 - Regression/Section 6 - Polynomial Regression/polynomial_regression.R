# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fit Linear
lin_reg = lm(formula = Salary ~ ., data = dataset)

# Fit Polynomial
dataset$Level2 = dataset$Level ^ 2
dataset$Level3 = dataset$Level ^ 3
dataset$Level4 = dataset$Level ^ 4
poly_reg = lm(formula = Salary ~ ., data = dataset)

# Visualize lin
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)), color = 'blue') +
  ggtitle('Truth or Bluff (Linear)') +
  xlab('Level') +
  ylab('Salary')

# Visualize poly
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)), color = 'blue') +
  ggtitle('Truth or Bluff (Polynomial)') +
  xlab('Level') +
  ylab('Salary')

# Predict lin
y_pred = predict(lin_reg, data.frame(Level = 6.5))

# Predict poly
y_poly_pred = predict(poly_reg, data.frame(Level = 6.5, Level2 = 6.5^2, Level3 = 6.5^3, Level4 = 6.5^4))
