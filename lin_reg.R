train_set = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/train.csv", header = TRUE, sep = ",")
test_set = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/test.csv", header = TRUE, sep = ",")

lin_mod = lm(median_house_value ~., data = train_set)

summary(lin_mod)

train_mse = mean(lin_mod$residuals^2)
test_mse = mean((predict.lm(lin_mod, newdata = test_set) - test_set$median_house_value)^2)

train_mse
test_mse

test_rmse = sqrt(test_mse)

test_rmse