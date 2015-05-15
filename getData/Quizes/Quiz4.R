## Quiz 4
##Question 1

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileUrl,destfile="./dataq4/housing.csv",mode="w",method="libcurl")
list.files(".")

house <- read.csv("dataq4/housing.csv")
strsplit(names(house), "wgtp")[123]

## Question 2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url=fileUrl,destfile="./dataq4/gdp.csv",mode="w",method="libcurl")
list.files(".")

gdp <- read.csv("dataq4/gdp.csv", skip=5, header=F, nrows=190)
head(gdp)

gross <- gsub(",", "", gdp[,"V5"])
x <-sapply(gross, as.numeric)
mean(x)

## Question 3
grep("^United",gdp$"V4")

## Question 4

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url=fileUrl2,destfile="./dataq4/education.csv",mode="w",method="libcurl")
list.files(".")

edu <- read.csv("dataq2/education.csv")
names(gross)
names(edu)

mg <- merge(gdp, edu, by.x="V1", by.y="CountryCode", sort=TRUE)

fiscal <- mg[grep("Fiscal year", mg$"Special.Notes"),]

grep("Fiscal year end: June", mg$"Special.Notes")


## Question 5
install.packages("quantmod")
library("quantmod")
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

s2012 <- sampleTimes[format(sampleTimes,'%Y') == 2012 ]
length(s2012)
length(s2012[weekdays(s2012) == "Monday"])

## Other solution
year2012 <- grepl('2012-*', sampleTimes)
# count 2012 observations (i.e. true)
table(year2012)

# subset based on 2012
sampleTimes2012 <- subset(sampleTimes, year2012)

# convert to day of week
day <- format(sampleTimes2012, '%A')

# count each day
table(day)

