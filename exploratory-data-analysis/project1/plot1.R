# I pre-processed the data with the following command:
# 
#   sed -n -e 1p -e 66638,69517p household_power_consumption.txt > household_power_consumption_truncated.txt
# 
# the purpose was to extract the relevant entries.
# The pre-processed file is included for convenience

data <- read.table('./data/household_power_consumption_truncated.txt', header = TRUE, sep = ";");

png(file = "plot1.png", width = 480, height = 480);

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power");

dev.off();

