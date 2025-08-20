#_____1. Find an interesting dataset
# Dataset: https://www.kaggle.com/datasets/fedesoriano/heart-failure-prediction

# Load libraries
library(ggplot2)
library(dplyr)
library(cluster)
library(factoextra)
library(caret)

# Import dataset
heart <- read.csv("heart.csv")

# Quick overview
str(heart)
summary(heart)
head(heart)

# Check for missing values
colSums(is.na(heart))

# Count unique values in each column
sapply(heart, function(x) length(unique(x)))



#_____2. Find clusters in your data (15 points)

# Normalize numeric features
num_data <- heart %>% select(Age, RestingBP, Cholesterol, MaxHR, Oldpeak)
num_data_scaled <- scale(num_data)

# Determine optimal number of clusters with Elbow method
fviz_nbclust(num_data_scaled, kmeans, method = "wss")

# Apply K-means clustering
set.seed(42)
kmeans_result <- kmeans(num_data_scaled, centers = 3, nstart = 25)

# Visualize clusters
fviz_cluster(kmeans_result, data = num_data_scaled,
             geom = "point", ellipse.type = "norm",
             palette = "jco", ggtheme = theme_minimal())



#_____3. Find outliers (15 points)

# Boxplots for numeric columns
boxplot(heart$Age, main = "Boxplot of Age", ylab = "Age")
boxplot(heart$RestingBP, main = "Boxplot of Resting BP", ylab = "mm Hg")
boxplot(heart$Cholesterol, main = "Boxplot of Cholesterol", ylab = "mg/dL")
boxplot(heart$MaxHR, main = "Boxplot of Max Heart Rate", ylab = "bpm")
boxplot(heart$Oldpeak, main = "Boxplot of Oldpeak", ylab = "ST depression")

# Check outlier values for Age
boxplot.stats(heart$Age)$out



#_____4. Draw regression line (logistic) (15 points)

# For plotting: create binary relationship with Cholesterol
ggplot(heart, aes(x = Cholesterol, y = HeartDisease)) +
  geom_jitter(height = 0.05, width = 0) +
  geom_smooth(method = "glm", method.args = list(family = "binomial"),
              se = FALSE, color = "darkred") +
  labs(title = "Logistic Regression: Heart Disease vs Cholesterol",
       x = "Cholesterol", y = "Probability of Heart Disease")



#_____5. Make regression analysis by using logistic regression (15 points)

# Fit logistic model
model <- glm(HeartDisease ~ Age + Cholesterol +
               MaxHR + Oldpeak + FastingBS + Sex + ChestPainType,
             data = heart, family = "binomial")

summary(model)



#_____6. Conclusions (25 points)

# Predict on the dataset
heart$prob <- predict(model, type = "response")
heart$predicted <- ifelse(heart$prob > 0.5, 1, 0)

# Confusion Matrix and Accuracy
confusionMatrix(factor(heart$predicted), factor(heart$HeartDisease))