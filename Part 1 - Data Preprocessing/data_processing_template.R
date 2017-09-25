# Data Preprocessing

# Importing the dataset
dataset = read.csv('Data.csv')
# dataset = dataset[, 2:3]

# Splitting test / train split
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = .8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])
