# I pre-processed the data with the following command:
# 
#   sed -n -e 1p -e 66638,69517p household_power_consumption.txt > household_power_consumption_truncated.txt
# 
# the purpose was to extract the relevant entries.
# The pre-processed file is included for convenience.

data <- read.table("./data/household_power_consumption_truncated.txt", header = TRUE, sep = ";");

png(file = "plot3.png", width = 480, height = 480);

date <- strptime(paste(d$Date, d$Time, sep = " "), "%d/%m/%Y %H:%M:%S");

legend_headings <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3");
legend_colours  <- c("black", "red", "blue");

plot(date, d$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l");
lines(date, d$Sub_metering_2, col = "red");
lines(date, d$Sub_metering_3, col = "blue");
legend("topright", legend_headings, lty = c(1, 1, 1), col = legend_colours);

dev.off();
