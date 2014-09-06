
data <- read.table('./data/household_power_consumption_truncated.txt', header = TRUE, sep = ";");

png(file = "plot2.png", width = 480, height = 480);

date <- strptime(paste(d$Date, d$Time, sep = " "), "%d/%m/%Y %H:%M:%S");

plot(date, d$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l");

dev.off();
