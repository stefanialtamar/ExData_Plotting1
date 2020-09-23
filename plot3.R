library("data.table")
powerconsumption <- data.table::fread(input = "household_power_consumption.txt")
powerconsumption[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerconsumption[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerconsumption <- power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot3.png", width=480, height=480)
plot(powerconsumption[, dateTime],
     powerconsumption[, Sub_metering_1],
     type="l",xlab="",ylab="Energy sub metering")
lines(powerconsumption[, dateTime], powerconsumption[, Sub_metering_2],col="red")
lines(powerconsumption[, dateTime],powerconsumption[, Sub_metering_3],col="blue")
legend("topright",
       col=c("black","red","blue"), 
       c("Sub_metering_1  ",
         "Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), 
       lwd=c(1,1))
dev.off()