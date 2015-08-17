# Data preparation (read -> convert to datetime -> subset)
x <- read.table(file = "household_power_consumption.txt", sep = ";", header = T, as.is = T)
x$datetime <- paste(x$Date, x$Time)
x$datetime <- strptime(x$datetime, "%d/%m/%Y %H:%M:%S")
x <- x[x$datetime >= "2007-02-01" & x$datetime < "2007-02-03", ]

# Set container
par(mfrow = c(2, 2))

# Plot top left
with(x, plot(datetime, Global_active_power, type="n", xlab = "", ylab = "Global Active Power"))
with(x, lines(datetime, Global_active_power))

# Plot top right
with(x, plot(datetime, Voltage, type="n", ylab = "Voltage"))
with(x, lines(datetime, Voltage))

# Plot bottom left
with(x, plot(datetime, Sub_metering_1, xlab = "", type = "n", ylab = "Energy sub metering"))
with(x, lines(datetime, Sub_metering_1, col = "black"))
with(x, lines(datetime, Sub_metering_2, col = "red"))
with(x, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n", cex = 0.7, x.intersp=5, adj = 0.3)

# Plot bottom right
with(x, plot(datetime, Global_reactive_power, type = "n"))
with(x, lines(datetime, Global_reactive_power))

# Output to png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
