## Coursera - Getting and Cleaning Data - Quiz 1
## Shu Wang

## Question 1
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "housing.csv", method = "curl")
housing <- read.csv("housing.csv")
nrow(subset(housing, VAL >= 24, select = VAL))

## Question 2
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile = "Natural Gas.xlsx", method = "curl")
library(xlsx)
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("Natural Gas.xlsx", sheetIndex = 1, rowIndex = rowIndex, colIndex = colIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

## Question 3
install.packages("XML")
library(XML)
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
restaurant <- xmlTreeParse(fileURL, useInternal = TRUE)
rootNode <- xmlRoot(restaurant)
zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(zipcode == '21231')

## Question 4
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
tempf <- tempfile()
download.file(fileURL, tempf, method = "curl")
library(data.table)
DT <- fread(tempf)
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])
