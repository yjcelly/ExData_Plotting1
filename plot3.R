###load the graph package  and time package
library(grDevices)
library(lubridate) 


#######read all data
full_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#####get the sub data of 2007-2-1 and 2007-2-2
sub_data <- na.omit(full_data[which(full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007"),])

###deal the date and time to the format type
x<-dmy(sub_data$Date)+hms(sub_data$Time)


png(filename="plot3.png",width = 480,height=480)

###print the graph Sub_metering_1 
with(sub_data,plot(x,Sub_metering_1,col="black",xlab="",ylab="Energy sub metering",type="l")  )

###print the graph of Sub_metering_2 and Sub_metering_3
with(sub_data,lines(x,Sub_metering_2,col="red") )
with(sub_data,lines(x,Sub_metering_3,col="blue") )

###print the legend of graph
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()
