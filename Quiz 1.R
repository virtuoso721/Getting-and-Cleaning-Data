## create directory of Data Cleaning
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./housing.csv", method = "curl")
list.files(".")
housing_data <- read.csv("housing.csv")

## Question 1. How many properties are worth $1,000,000 or more?
housing_data_narm_logival <- complete.cases(housing_data$VAL)
housing_data_VAL_24_logical <- housing_data$VAL == 24
sum(housing_data_narm_logival & housing_data_VAL_24_logical)

## Qestion 3.
library("xlsx")
library("rJava"
library("xlsxjars")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
setwd("./Data Cleaning")
download.file(fileUrl, destfile = "./Natural Gas.csv", method = "curl")
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("./Natural Gas.csv", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

## Question 4.
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
restaurant <- xmlTreeParse(fileUrl, useInternal = TRUE)
rootNode <- xmlRoot(restaurant)
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zipcode == "21231")

## Question 5.
library(data.table)
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./idahoHousing.csv", method = "curl")
DT <- fread("./idahoHousing.csv")
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(rowMeans(DT)[DT$SEX==1])+system.time(rowMeans(DT)[DT$SEX==2])
