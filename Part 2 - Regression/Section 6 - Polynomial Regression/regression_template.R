# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Create regressor
#poly_reg = lm(formula = Salary ~ ., data = dataset)

# Predict poly
y_poly = predict(reg, data.frame(Level = 6.5))

# Visualize poly
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)), color = 'blue') +
  ggtitle('Truth or Bluff (Regressor)') +
  xlab('Level') +
  ylab('Salary')
