# Data preparation (read -> convert to datetime -> subset)
x <- read.table(file = "household_power_consumption.txt", sep = ";", header = T, as.is = T)
x$datetime <- paste(x$Date, x$Time)
x$datetime <- strptime(x$datetime, "%d/%m/%Y %H:%M:%S")
x <- x[x$datetime >= "2007-02-01" & x$datetime < "2007-02-03", ]

# Plot 2
with(x, plot(datetime, Global_active_power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(x, lines(datetime, Global_active_power))

# Output to png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()