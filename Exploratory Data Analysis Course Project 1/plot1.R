library(readr) 
filedata <-"household_power_consumption.txt"                         ##add the file "household_power_consumption.txt" into filedata
data <- read.csv2(file=filedata)            
power <- read.csv2(file=filedata,skip = 66636, nrow=2880)            ## read the data from txt file, where 2007.2.1 and 2007.2.2 are in the data of start at line 66637, and continue for 2880 lines 
power0 <- data.frame(power,stringsAsFactors=F)
x = as.numeric(lapply(power0[,3],as.numeric))                        ##change the type of data in data.frame, change the charcter into numeric 
png("plot1.png", width=480, height=480)                              ## make png plot with width=480, height=480
hist(x, col= "red",xlab= 'Global Active Power (kilowatts)',main='')  ##plot the histogram, with lable of x is 'Global Active Power (kilowatts)', no title
title("Global Active Power")                                         ##add title "Global Active Power"
bmp(width=480,height=480)                                            ##change the width and height into 480
dev.off()                                                            ##turn off graphic device

