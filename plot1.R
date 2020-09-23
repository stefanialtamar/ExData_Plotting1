library("data.table")
powerconsumption <- data.table::fread(input = "household_power_consumption.txt")
powerconsumption[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerconsumption[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
powerconsumption <- powerconsumption[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot1.png", width=480, height=480)
hist(powerconsumption[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power(Kw)",ylab="Frequency",col="Red")
dev.off()