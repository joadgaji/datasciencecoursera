## Quiz 1

##Question 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileUrl,destfile="./dataq1/idaho_housing.csv",mode="w",method="libcurl")
list.files(".")
idaho_housing <- read.csv("dataq1/idaho_housing.csv")
head(idaho_housing)

#Code book says VAL with 24 represents any house more than $1000000. 
#Following piece of code is trying to get count on house price >$1000000 whose value is not NA
length(idaho_housing$VAL[!is.na(idaho_housing$VAL) & idaho_housing$VAL==24])


## Question 3
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url=fileUrl1, destfile="dataq1/gov_NGAP.xlsx", mode="wb", method="libcurl")

library(xlsx)

rowIndex <- 18:23
colIndx <- 7:15
dat <- read.xlsx(file="dataq1/gov_NGAP.xlsx",sheetIndex=1,colIndex=colIndx,startRow=18, endRow=23, header=TRUE)
head(dat)
sum(dat$Zip*dat$Ext,na.rm=T)


## Question 4
library(XML)

fileUrl2 <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
doc <- xmlTreeParse(file=fileUrl2,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

rootNode[[1]][[1]]

zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcode[zipcode==21231])
length(zipcode[zipcode == 21231])

## Question 5

ileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=fileUrl1, destfile="dataq1/fsspid.csv", method="libcurl")

install.packages("data.table")
library(data.table)
DT <- fread(input="dataq1/fsspid.csv", sep=",")

system.time(DT[,mean(pwgtp15),by=SEX])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) 
system.time(mean(DT[DT$SEX==2,]$pwgtp15))