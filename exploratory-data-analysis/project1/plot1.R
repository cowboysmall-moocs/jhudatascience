
data <- read.table('./data/household_power_consumption_truncated.txt', header = TRUE, sep = ";");

png(file = "plot1.png", width = 480, height = 480);

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power");

dev.off();

