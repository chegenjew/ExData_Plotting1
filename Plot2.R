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

#Plot the Timeseries for Global Active power 
png(filename = "Plot2.png", width = 480, height = 480)

with(HPC, plot(Global_active_power ~ Date_Time , type = "l", ylab= "Global Active Power (kilowatts)", xlab = ""))
dev.off()