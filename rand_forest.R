library(randomForest)

train_set = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/train.csv", header = TRUE, sep = ",")
test_set = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/test.csv", header = TRUE, sep = ",")

rand_for = randomForest(median_house_value ~., data = train_set, importance = TRUE)

train_preds = predict(rand_for, train_set, type = "response")
test_preds = predict(rand_for, test_set, type = "response")

train_mse = mean((train_preds - train_set$median_house_value)^2)
test_mse = mean((test_preds - test_set$median_house_value)^2)
test_rmse = sqrt(test_mse)

train_mse
test_mse
test_rmse
