###load the graph package 
library(grDevices)

#######read all data
full_data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#####get the sub data of 2007-2-1 and 2007-2-2
sub_data <- na.omit(full_data[which(full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007"),])


###print the graph to the png file
png(filename="plot1.png",width = 480,height=480)

###show the Histograms of Global_active_power
hist(sub_data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
