# Loading necessary packages to read excel file.
library(ggplot2)
library(readxl)

# Reading the excel file and assigning to the variable 'acse' then printing it.
acse <- read_excel("acs-14-1yr-s0201.xlsx")
head(acse)

# List the name of each field and what
# you believe the data type and intent is
# of the data included in each field

# Id - Data Type: Character - Intent: Unique county id
# Id2 - Data Type: Numeric - Intent: Last 4 of unique id
# Geography - Data Type: Character - Intent: Name of county 
# PopGroupID - Data Type: Numeric - Intent: Subset "1" of a larger group
# POPGROUP.display-label - Data Type: Character - Intent: "Total Population"
# RacesReported - Data Type: Numeric - Intent: Total population of the county
# HSDegree - Data Type: Numeric - Intent: % of population with High School Degree
# BachDegree - Data Type: Numeric - Intent: % of population with Bachelor Degree

# Run the following functions and provide the results: str(); nrow(); ncol()
str(acse)
nrow(acse)
ncol(acse)

# Create a Histogram of the HSDegree variable using the ggplot2 package.
# Set a bin size for the Histogram that you think best visuals the data
# (the bin size will determine how many bars display and how wide they are)
# Include a Title and appropriate X/Y axis labels on your Histogram Plot.

ggplot(acse, aes(HSDegree)) + geom_histogram(bins=10) + 
    ggtitle("Percentage of HSDegrees vs. Number of Counties") + 
    xlab("Percentage of HSDegrees") + ylab("Number of Counties")

# Answer the following questions based on the Histogram produced:

# Based on what you see in this histogram, is the data distribution unimodal?
# ANSWER: YES

# Is it approximately symmetrical?
# ANSWER: NO

# Is it approximately bell-shaped?
# ANSWER: NO

# Is it approximately normal?
# ANSWER: NO

# If not normal, is the distribution skewed? If so, in which direction?
# ANSWER: YES, LEFT SKEWED

# Include a normal curve to the Histogram that you plotted.
ggplot(acse, aes(HSDegree)) + 
    geom_histogram(aes(y=..density..), color="black", fill="blue", bins=10) +
    ggtitle("Percentage of HSDegrees vs. Number of Counties") + 
    xlab("Percentage of HSDegrees") + ylab("Number of Counties") + 
    stat_function(fun=dnorm, args=list(mean=mean(acse$HSDegree, na.rm=TRUE),
                  sd=sd(acse$HSDegree, na.rm=TRUE)), colour="black", linewidth=2)
        
# Explain whether a normal distribution can accurately be used as a model for this data.
# ANSWER: No, as we can see the mean is outside of the normal distribution curve
# making this data skewed to the left.

# Create a Probability Plot of the HSDegree variable.


