printmessage <- function(x){
  if(x>0)
    print("x is greather than 0")
  else
    pirnt("x is less or equal to 0")
  invisible(x)
}

mean(iris[which(iris[,'Species'] == 'virginica'),'Sepal.Length'])
rowMeans(iris[, 1:4])
6.588
apply(iris[, 1:4], 2, mean)
with(mtcars, tapply(mpg, cyl, mean))
  126.5779
Execution of 'ls' will suspend at the beginning of the function and you will be in the browser
