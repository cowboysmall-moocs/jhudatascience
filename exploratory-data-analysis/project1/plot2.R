# I pre-processed the data with the following command:
# 
#   sed -n -e 1p -e 66638,69517p household_power_consumption.txt > household_power_consumption_truncated.txt
# 
# the purpose was to extract the relevant entries.
# The pre-processed file is included for convenience

data <- read.table('./data/household_power_consumption_truncated.txt', header = TRUE, sep = ";");

png(file = "plot2.png", width = 480, height = 480);

date <- strptime(paste(d$Date, d$Time, sep = " "), "%d/%m/%Y %H:%M:%S");

plot(date, d$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l");

dev.off();
