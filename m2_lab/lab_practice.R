# Before you can visualize your data you have to get it into R. This involves 
# importing the data from an external source

# Importing and cleaning data
# R can import data from almost any source including text files, excel 
# spreadsheets, statistical packages and database systems.

# we'll illistrate these techniques using the salaries dataset containing the 
# 9 month academic salaries of college professors ata single institution in 
# 2008-2009.

# this readr package provides funtions for importing delimeted text files into 
# r dataframes
install.packages("carData")
install.packages("readr")
install.packages("readxl")
install.packages("haven")

library(carData)
library(readr)
# the readxl package can import data form excel. both xls and xlsx
library(readxl)
# haven package provides functions for importing data form stats packages
library(haven)

# set working directory where data is
setwd("~/Data Science/R_Scripts/dsci_602/week_4_lab/salary_data")

# Check out the new data 
data("Salaries")
names(Salaries)

# import data from a comma delimeted file
Salaries_csv <- read_csv("salaries.csv")

# import data from a tab delimeted file
Salaries_tsv <- read_tsv("salaries.txt")

# import the data from excel workbook.you can specify number of sheets default 1
Salaries_excel <- read_excel("salaries.xlsx", sheet=1)

#import from Stata
Salaries_stata <- read_dta("salaries.dta")

#import from SPSS
Salaries_spss <- read_sav("salaries.sav")

#import from SAS
Salaries_sas <- read_sas("salaries.sas7bdat")

################################################################################

my.number <- 10
my.number = 10
print(my.number)

mycha1 <- "hello"
print(mycha1)

6+4

a <- 6
b <- 4
c <- a + b
print(c)

d = sqrt(a)
e = log(a)
d
print(d)
e
print(e)

# c is for combining
v1 <- c(1,2,2.5)
print(v1)

v2 <- c(2,4,5)
print(v2)

v3 <- c(v1,v2)
print(v3)

v4 <- v3[2]

v5 <- v3[c(2,3,5)]

v6 <- sin(v3)

v7 <- length(v3)

v8 <- class(v3)

v9 <- class(mycha1)

# summary gives basic statistics
summary(v3)

mean(v3)
min(v3)
median(v3)
max(v3)

names(v3)
names(v3) = c("a", 'b', "c", "d", "hello", "yes")
names(v3)

seqnum <- 1:6
seqnum1 <- c(1:6)
seqnum2 <- seq(from = 1, to = 12, by = 4)

3*2
ma <- matrix(1:6, nrow = 3, ncol = 2)
ma

mb <- matrix(7:9, nrow = 3, ncol = 1)
mb

# matrix column binding
cbind()
# matrix row binding
rbind()

# wont work because the c() is a vector of 3 and there are only 2 rows
rbind(ma,c(10,20,25))

dim(ma)
dim(c(10,20,25))

rbind(ma,c(10,20))
# needs same number of rows
cbind(ma, mb)
ma
ma[2,2]

ma[1:2,1]

ma[,1]
ma[,2]
ma[1,]

dim(ma)
ncol(ma)
nrow(ma)


ma_t <- t(ma)
ma
ma_t

ma_b <- cbind(ma,mb)

ma_diag <- diag(ma_b)
ma_diag

mn <- matrix(1:16, nrow = 4, ncol = 4)
mn_diag <- diag(mn)
mn
mn_diag

mn+2
mn*2

mn1 <- mn+1
mn_multiply <- mn1%*%mn
mn1
mn
mn_multiply
2*1+6*2+10*3+14*4

# put multiple variables into 1
my.list <- list(v1,mycha1,ma)
my.list[1]
my.list[3]

my.list <- list(numeric = v1, character = mycha1, matrix = ma)
my.list[1]
my.list[3]

names(my.list)

# if the list has a name you can do below method
my.list$matrix

################################################################################

data("mtcars")
class(mtcars)
names(mtcars)
?mtcars
View(mtcars)
head(mtcars)
summary(mtcars)

mtcars$mpg
mtcars[,1]
