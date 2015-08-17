# Data preparation (read -> convert to datetime -> subset)
x <- read.table(file = "household_power_consumption.txt", sep = ";", header = T, as.is = T)
x$datetime <- paste(x$Date, x$Time)
x$datetime <- strptime(x$datetime, "%d/%m/%Y %H:%M:%S")
x <- x[x$datetime >= "2007-02-01" & x$datetime < "2007-02-03", ]

# Plot 3
with(x, plot(datetime, Sub_metering_1, xlab = "", type = "n", ylab = "Energy sub metering"))
with(x, lines(datetime, Sub_metering_1, col = "black"))
with(x, lines(datetime, Sub_metering_2, col = "red"))
with(x, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), x.intersp=5, adj = 0.4)

# Output to png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()