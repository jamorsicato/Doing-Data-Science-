# first R Script

# Doing Data Science Problem 1 


#read in data 
file = "/Users/jonnymorsicato/Desktop/Doing Data Science Problems /dds_datasets/dds_ch2_nyt/nyt1.csv"
data1 <- read.csv(file) # <- is the assignment operator in R 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Create a new variable age_group that categorizes users as c(-Inf,0,18,24,34,44,54,64,Inf)
install.packages("doBy")
library("doBy")
siterange <- function(x){c(length(x),min(x),mean(x),max(x))}  #function x in c vector out
summaryBy(Age~agecat,data = data1, FUN = siterange)

#c(function) generic functions that makes a vector can be used with function(x){c(1,2,..,N)} to make composite fucntion 
#$ dollar sign operator extracts elements by name from a named list 
# cut() breaks up data into groups

#NOTES ON VECTORS
# - vectors in R are 1 dimensionsal 
# - matrix is 2 dimensions 
# - array is N dimensions 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

summaryBy(Gender+Signed_In+Impressions+Clicks~agecat, data = data1)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
install.packages("ggplot2")
install.packages("gridExtra")
library(ggplot2)
i1 <- ggplot(data1,aes(x=Impressions,fill = agecat)) + geom_histogram(binwidth = 0.5) 
                                          +  labs(
                                                  title = "Impressions Per Age Group", 
                                                  x = "Impressions", 
                                                  y = "Number of Impressions") 

c1 <- ggplot(data1,aes(x = agecat, y = Impressions, fill = agecat)) + geom_boxplot()
c1
#make new variable CTR 

# we dont care about CTR for clicks that dont have impressions 
# the data1$hasimpr notation created a new variable in the array

data1$hasimpr <- cut(data1$Impressions,c(-Inf,0,Inf)) 
summaryBy(Clicks~hasimpr, data = data1, FUN = siterange)
ggplot(subset(data1, Clicks > 0), aes(x=Clicks/Impressions, fill = agecat)) 
+ geom_density()

# NOTES ON ggplot2 
# -  geom_historgam() visualize continuous data by dividing the x axis into bins 

# plot distributions of impressions and clicks with the age group rate 


# also Click through rate = CTR=# clicks/# impressions 


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

#make a new variable to segment or categorize user on their click behavior 



#basic statistics
#mean(data$Age) obviously returns the mean of the age data 
#max()
#table()



