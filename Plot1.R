#import the required packages 
library(data.table)
library(lubridate)

#read the HouseHold power consumption data data 
  HPC <- fread(file = "household_power_consumption.txt", sep = ";", na.strings = "?")
  
#subset the data to include only the dates for 1/2/2007 and 2/2/2007
  HPC <- subset(HPC, Date == "1/2/2007" |Date == "2/2/2007" )
  
#coerce the Date and Time variables to Date and time data type 
  HPC$Date <- dmy(HPC$Date)
  HPC$Time <- hms(HPC$Time)
  
#construct the plot and write it to PNG device 
  png(filename = "Plot1.png", width = 480, height = 480)
  hist(HPC$Global_active_power, col = "red", main = "Global Active Power",
                xlab = "Global Active Power (Killowatts)",
                ylim = c(0, 1200))
  dev.off()
  
  