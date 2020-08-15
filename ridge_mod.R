library(glmnet)

train_set = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/train.csv", header = TRUE, sep = ",")
test_set = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/test.csv", header = TRUE, sep = ",")

y_train = data.matrix(train_set$median_house_value)
y_test = data.matrix(test_set$median_house_value)

X_train = model.matrix(median_house_value ~., data = train_set)[,-1]
X_test = model.matrix(median_house_value ~., data = test_set)[,-1]

grid = 10^seq(10, -2, length=100)
ridge.mod = glmnet(X_train, y_train, alpha=0, lambda=grid)

cv.out = cv.glmnet(X_train, y_train, alpha=0, lambda = grid)
best_lam = cv.out$lambda.min

train_preds = predict(ridge.mod, s = best_lam, newx = X_train)
test_preds = predict(ridge.mod, s = best_lam, newx = X_test)

train_mse = mean((train_preds - y_train)^2)
test_mse = mean((test_preds - y_test)^2)
test_rmse = sqrt(test_mse)

train_mse
test_mse
test_rmse
