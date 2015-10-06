###load the graph package  and time package
library(grDevices)
library(lubridate) 


#######read all data
full_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#####get the sub data of 2007-2-1 and 2007-2-2
sub_data <- na.omit(full_data[which(full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007"),])

###deal the date and time to the format type
x<-dmy(sub_data$Date)+hms(sub_data$Time)


###print the graph to the png file of global active power
png(filename="plot2.png",width = 480,height=480)
plot(x,sub_data$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()


