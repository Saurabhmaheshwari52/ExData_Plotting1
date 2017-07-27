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
## Creating another table having date/time in Posixlt format
cat_date_time = paste(as.Date(data[,1], format = "%d/%m/%Y"), data[,2])
new_data = cbind(data,cat_date_time)
## Creating Plot
png(filename = "plot3.png", width = 480, height = 480)
attach(new_data)
plot(as.POSIXlt(cat_date_time), Sub_metering_1, type = "n", xlab = " ", 
     ylab = "Energy sub metering")
points(as.POSIXlt(cat_date_time), Sub_metering_1, type = "l")
points(as.POSIXlt(cat_date_time), Sub_metering_2, type = "l", col = "red")
points(as.POSIXlt(cat_date_time), Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
detach(new_data)
dev.off()