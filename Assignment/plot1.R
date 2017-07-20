## Creating the required data
lines = readLines("household_power_consumption.txt")
subs = grep("^[12]/2/2007", substr(lines, 1,10))
sublines = lines[subs]
data = read.table(text = sublines, sep = ";",
                  col.names = c("Date","Time", 
                                "Global_active_power", "Global_reactive_power",
                                "Voltage", "Global_intensity", 
                                "Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"))
## creating the graph
png(filename = "plot1.png", width = 480, height = 480)
hist(Global_active_power, col = "red", xbind = "Global Active Power (kilowatts)")
dev.off()
