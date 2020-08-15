library(tree)

train_set = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/train.csv", header = TRUE, sep = ",")
test_set = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/test.csv", header = TRUE, sep = ",")

regress_tree = tree(median_house_value ~ ., train_set)
summary(regress_tree)

train_preds = predict(regress_tree, newdata = train_set)
test_preds = predict(regress_tree, newdata = test_set)

train_mse = mean((train_preds - train_set$median_house_value)^2)
test_mse = mean((test_preds - test_set$median_house_value)^2)
test_rmse = sqrt(test_mse)

train_mse
test_mse
test_rmse


