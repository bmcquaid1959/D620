

# Code from: https://bookdown.org/steve_midway/DAR/exploratory-data-analysis.html#exploratory-data-analysis

# Tabulate earthquakes by magnitude
magnitude.counts <- table(quakes$mag)
# plot counts of earthquakes by magnitude
barplot(magnitude.counts,
        xlab = "Magnitude",
        ylab = "Frequency",
        las = 1,
        col = "black")

# Histogram of the heights of black cherry trees
hist(trees$Height)

# Histogram of the heights of black cherry trees
hist(trees$Height,
     las = 1, # rotate numbers on y-axis
     col = "brown", # black bars
     border = "white", # white border
     main = '', # Leave the title empty (use caption)
     breaks = 10, # 10 bins
     xlim = c(60,90), # Range of x-axis
     xlab = "Black Cherry Tree Height") # y-axis label

# Scatterplot of Black Cherry Tree Height and Volume
plot(trees$Volume ~ trees$Height)

# Scatterplot of Black Cherry Tree Height and Volume
plot(trees$Volume ~ trees$Height, # The plot in formula syntax; y ~ x
     xlim = c(60,90), # Range of x-axis
     ylim = c(0,100), # Range of y-axis
     pch = 19, # Plotting symbol change to filled-in circle
     xlab = "Height", # x-axis label
     ylab = "Volume", # y-axis label
     las = 1) # Rotate numbers on y-axis

# Boxplot of ozone by month for New York
boxplot(airquality$Ozone ~ airquality$Month)

# Boxplot of ozone by month for New York
boxplot(airquality$Ozone ~ airquality$Month,
        xlab = "Month", # x-axis label
        ylab = "Ozone", # y-axis label
        las = 1, # Rotate numbers on y-axis
        ylim = c(0,200), # Range of y-axis
        col = "lightblue", # Boxplot fill color
        border = "darkred", # Boxplot border color
        pch = 19) # Symbol for outliers

library(dplyr)
head(iris) # show 5 columns

# Select by column order
head(dplyr::select(iris, c(2,4)))

# Select by column name
head(dplyr::select(iris, c('Sepal.Width','Petal.Width')))

# Select by column name criteria
head(dplyr::select(iris, ends_with('Width')))

# To save output as object
# iris_new <- select(iris, ends_with('Width'))

# Filter for only virginica species
head(filter(iris, Species == 'virginica'))

# Filter for only Petal.Width greater than 2.0
head(filter(iris, Petal.Width > 2.0))

# Filter for only Petal.Width greater than 2.3
# and the virginica species
head(filter(iris, Petal.Width > 2.3 & Species == 'virginica'))

# Arrange by Sepal.Length
head(arrange(iris, Sepal.Length))

# Arrange by Sepal.Length decreasing
head(arrange(iris, desc(Sepal.Length)))

# Rename Species column in iris
head(rename(iris, sp = Species))

# Rename Species column in iris
head(mutate(iris, Petal_condition = Petal.Length/Petal.Width))

# Rename Species column in iris
group_by(iris, Species)

# Get mean condition for each species
iris %>%
  mutate(Petal_condition = Petal.Length/Petal.Width) %>%
  group_by(Species) %>%
  summarize(
    cond = mean(Petal_condition)
  )
