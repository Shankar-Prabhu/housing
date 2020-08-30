# housing
 Predicting median house values in California neighborhoods

## Data Used
This dataset is taken from [here](https://www.kaggle.com/harrywang/housing) and is based on California Census data from 1990. It contains information on the median house value in a census block (can think of this like a neighborhood, but as it pertains to the U.S. Census), and various other attributes of homes in the census block. These attributes include lat/long, total bedrooms, total rooms, median house age, population, and median income. 

## Process
I used all of the features used in this dataset in the models that I explored. One of the features was categorical (the relation of the homes to the ocean, ex. inland, near bay, etc.) which I used one-hot encoding to make usable. Then, there were some missing values in the total bedrooms, but this was only 1% of the data so I got rid of it; I coudl have replaced with the median/mean value for the column but that missing data was small enough to just delete. Then, I created a training set (80%) and a testing set (20%) to use for training and evaluation of various models. The models explored include linear regression, ridge regression, a single regression tree, and a random forest. Lastly, I compared the RMSE of each models and evaluated their complexity to determine which models would be the best fit to use for new data. 

## Model Comparison
The following models were compared on their test RMSE.

**Linear Regression**: $68,684.12

**Ridge Regression**:  $68,699.72

**Regression Tree**:   $76,149.10

**Random Forest**:     $50,831.29

Additional details on each model are below:
Linear Regression: This used a full model with all features and no interaction terms. I think it could have been useful to add interactions between the one categorical variable (proximity to ocean) and various continuous variables to see if there were significant changes in median home value. 
Ridge Regression: Lambda was chosen to be 100 based on cross validation
Regression Tree/Random Forest: Variable importance plot of the random forest and the higher-up variables on the single regression tree reveal that by far the most important variable in predicting median home value is median income. Some other important variables are if the ocean proximity was "inland", the housing median age, and population.

## Conclusions
The best model is the random forest because it has a significantly lower RMSE and while it does add great complexity, the runtime was not significantly different to lead me to believe that another model would be more optimal. However, even the performance of the random forest is not very good. I think the best way to fix this would be to add additional data and features to the model that we believe would be predictive.
