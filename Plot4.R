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

#open printing device 
png(filename = "Plot4.png")

#Modify the global parameters for the print device
par(mfrow =c(2,2))

#plot on 1st Row , 1st Column
with(HPC, plot(Global_active_power ~ Date_Time , type = "l", ylab= "Global Active Power (kilowatts)", xlab = ""))

#plot on 1st row, 2nd column 
with(HPC, plot(Voltage ~ Date_Time , type = "l", ylab= "Voltage", xlab = "datetime"))

#plot 2nd row , 1st column 
with(HPC, plot(Sub_metering_1 ~ Date_Time, type = "l", xlab = "", ylab = "Energy Sub Metering"))
lines(HPC$Sub_metering_2 ~ HPC$Date_Time, col= "red")
lines(HPC$Sub_metering_3 ~ HPC$Date_Time, col= "blue")
legend("topright",lty = 1,  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

#plot the 2nd Row, 2nd column 
with(HPC, plot(Global_reactive_power ~ Date_Time , type = "l", ylab= "Global_reactive_power", xlab = "datetime"))

#close the printing device
dev.off()