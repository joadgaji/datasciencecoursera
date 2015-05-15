## Quiz 3
## Question 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileUrl,destfile="./dataq2/communities.csv",mode="w",method="libcurl")
list.files(".")

com <- read.csv("dataq2/communities.csv")
agricultureLogical <- com$ACR == 3 & com$AGS == 6
head(com[which(agricultureLogical),])

## Question 2
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url=fileUrl,destfile="./dataq2/image.jpg",mode="wb",method="libcurl")
list.files(".")

install.packages("jpeg")
library("jpeg")
img <- readJPEG("./dataq2/image.jpg", native=TRUE)
quantile(img, probs =c(.30,.80))

## Question 3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url=fileUrl,destfile="./dataq2/gross.csv",mode="w",method="libcurl")

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url=fileUrl2,destfile="./dataq2/education.csv",mode="w",method="libcurl")
list.files(".")

gross <- read.csv("dataq2/gross.csv", skip = 5, header = FALSE, nrows=190)
gross[,"V2"] <- as.numeric(gross[,"V2"])

edu <- read.csv("dataq2/education.csv")
names(gross)
names(edu)

mg <- merge(gross, edu, by.x="V1", by.y="CountryCode", sort=TRUE)
nrow(mg)

View(mg)

library("plyr")
mg[,"V2"] <- as.numeric(mg[,"V2"])
head(mg[order(mg$V2, decreasing=TRUE),],13)


## Question 4
mean(mg[mg$"Income.Group" == "High income: OECD","V2"])
mean(mg[mg$"Income.Group" == "High income: nonOECD","V2"])

## Question 5
mg$rGroups <- cut(mg$V2, breaks=quantile(mg$V2, c(0,0.2,0.4,0.6,0.8,1)))
table(mg$rGroups)
table(mg$rGroups, mg$Income.Group)

## Otra sol pero no usa lo que pide la pregunta
quentile <- c(0.2,0.4,0.6,0.8,1)
q <- quantile(mg$V2, quentile)
q1 <- mg$V2 <= 38
xtabs(q1 ~ mg$Income.Group)