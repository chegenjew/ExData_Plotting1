#import the required packages 
library(data.table)
library(lubridate)
library(dplyr)


#read the HouseHold power consumption data data 
HPC <- fread(file = "household_power_consumption.txt", sep = ";", na.strings = "?")

#subset the data to include only the dates for 1/2/2007 and 2/2/2007
HPC <- subset(HPC, Date == "1/2/2007" |Date == "2/2/2007" )

#create a new Date_Time Variable 
HPC$Date_Time<- with(HPC, as.POSIXct(paste(Date,Time), format = "%d/%m/%Y %H:%M:%S"))

#plot the Graphs 
png(filename = "Plot3.png")
with(HPC, plot(Sub_metering_1 ~ Date_Time, type = "l", xlab = "", ylab = "Energy Sub Metering"))
lines(HPC$Sub_metering_2 ~ HPC$Date_Time, col= "red")
lines(HPC$Sub_metering_3 ~ HPC$Date_Time, col= "blue")
legend("topright",lty = 1,  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()