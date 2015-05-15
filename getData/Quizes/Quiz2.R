install.packages("httr")
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "82e7ab3547b64d7ec12f",
                   secret = "abf2c0976ac71d425619978f01786b9b1fabbdcf")

# 3. Get OAuth credentials
install.packages("httpuv")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)

x<- content(req)
x[[5]]$full_name
x[[5]]$created_at


## Question 2

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=fileUrl,destfile="./dataq1/weights.csv",mode="w",method="libcurl")
list.files(".")
acs <- read.csv("dataq1/weights.csv")
head(acs)

install.packages("sqldf")
library("sqldf")
sqldf("select pwgtp1 from acs where AGEP < 50")
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")


## Question 4
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode <- readLines(con)
lapply(htmlcode, nchar)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)
close(con)

## Question 5
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url=fileUrl,destfile="./dataq1/numbers.for",mode="w",method="libcurl")
list.files(".")
file_name <- "./dataq1/numbers.for"
df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
[1] 32426.7