library(mltools)
library(data.table)
data = read.csv("C:/Users/shank/Documents/Data_Science_Projects/housing/housing.csv", header = TRUE, sep = ",")


data = one_hot(as.data.table(data), cols = "ocean_proximity")

data <- data[, c("latitude", "longitude", "housing_median_age", "total_rooms", "total_bedrooms", 
               "population", "households", "median_income",
               "ocean_proximity_<1H OCEAN", "ocean_proximity_INLAND",
               "ocean_proximity_ISLAND", "ocean_proximity_NEAR BAY", "ocean_proximity_NEAR OCEAN", 'median_house_value')]
data = data[,-11]
data = data[complete.cases(data)]
set.seed(1)

train_rows = sample(nrow(data), floor(0.8*nrow(data)))


train_set = data[train_rows,]
test_set = data[-train_rows,]

write.csv(train_set, "C:/Users/shank/Documents/Data_Science_Projects/housing/train.csv", row.names = FALSE )
write.csv(test_set, "C:/Users/shank/Documents/Data_Science_Projects/housing/test.csv", row.names = FALSE )

