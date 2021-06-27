library(readr)
filedata <-"household_power_consumption.txt"                                 ##add the file "household_power_consumption.txt" into filedata
power <- read.csv2(file=filedata,skip = 66636, nrow=2880)                    ##read the datafile at 2007/02/01 and 2007/02/02, which start at line66637 and have 2880 lines
dt <- paste(power[,1],power[,2])
datetime <- as.POSIXct(dt,format= "%d/%m/%Y %H:%M:%S")                       ##combine the time and date and change it into POSIXct type
datay3 <- as.numeric(lapply(power[,3],as.numeric))                           ##add the data of Global Active Power into datay3, set it into numeric class
datay4 <- as.numeric(lapply(power[,4],as.numeric))                           ##add the data of Global reactive power into datay4, set it into numeric class
datay5 <- as.numeric(lapply(power[,5],as.numeric))                           ##add the data of Voltage into datay5, set it into numeric class
datay7 <- as.numeric(lapply(power[,7],as.numeric))                           ##add the data of Sub_metering_1 energy into datay7, set it into numeric class
datay8 <- as.numeric(lapply(power[,8],as.numeric))                           ##add the data of Sub_metering_2 energy into datay8, set it into numeric class
datay9 <- as.numeric(lapply(power[,9],as.numeric))                           ##add the data of Sub_metering_3 energy into datay9, set it into numeric class
png("plot4.png",width=480,height=480)                                        ##make png plot with width=480, height=480 
par(mfrow=c(2,2))                                                            ##set the frame of plot, it's row wise order
plot(x=datetime, y=datay3, type="l",xlab="",ylab="Global Active Power")      ##make 1st plot for plot4, it's on topleft,x is datetime, y is Global Active Power,type is line 

plot(x=datetime, y=datay5, type="l",xlab="datetime",ylab="Voltage")          ##make 2nd plot for plot4, it's on topright,x is datetime, y is Voltage,type is line

plot(x=datetime, y=datay7, type="l",xlab="",ylab="Energy sub metering")      ##make 3rd plot for plot4, it's on downnleft,it contains 3 lines,make 1st line, x is datetime,y is Sub_metering_1 energy, type is line
lines(x=datetime, y=datay8, col="red")                                       ##make 2nd line of 3rd plot,x is datetime,y is Sub_metering_2 energy
lines(x=datetime, y=datay9, col="blue")                                      ##make 3rd line of 3rd plot,x is datetime,y is Sub_metering_3 energy
legend("topright",c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),col=c("black","red","blue"),lty=c(1,1),bty="n")      ##make legend at topright of 3rd plot of plot4,

plot(x= datetime, y=datay4, type="l",xlab="datetime",ylab="Global_reactive_power")         ##make 4th plot for plot4, it's on downright,x is datetime, y is Global_reactive_power,type is line
dev.off()                                                                                  ##turn off the graphic device



