###load the graph package  and time package
library(grDevices)
library(lubridate) 


#######read all data
full_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#####get the sub data of 2007-2-1 and 2007-2-2
sub_data <- na.omit(full_data[which(full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007"),])

###deal the date and time to the format type
x<-dmy(sub_data$Date)+hms(sub_data$Time)



png(filename="plot4.png",width = 480,height=480)

###set the mfrow to show 2*2 graph
par(mfrow=c(2,2))

###show the first graph
with( sub_data, plot(x,Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)") )

###show the second graph
with( sub_data, plot(x,Voltage,type="l",xlab="datetime",ylab = "Voltage")   )

###show the third graph
with(sub_data,plot(x,Sub_metering_1,col="black",xlab="",ylab="Energy sub metering",type="l")  )
with(sub_data,lines(x,Sub_metering_2,col="red") )
with(sub_data,lines(x,Sub_metering_3,col="blue") )
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

#show the fourth graph
with(sub_data, plot(x,Global_reactive_power,type="l",xlab="datetime",ylab = "Global_reactive_power")     )
dev.off()


