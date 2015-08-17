# Data preparation (read -> convert to datetime -> subset)
x <- read.table(file = "household_power_consumption.txt", sep = ";", header = T, as.is = T)
x$datetime <- paste(x$Date, x$Time)
x$datetime <- strptime(x$datetime, "%d/%m/%Y %H:%M:%S")
x <- x[x$datetime >= "2007-02-01" & x$datetime < "2007-02-03", ]

# Plot 1
with(x, hist(as.numeric(Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))

# Output to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()