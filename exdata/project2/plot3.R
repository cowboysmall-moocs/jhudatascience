
if (!require('reshape2')) {

    install.packages('reshape2');
    require('reshape2');
}

if (!require('ggplot2')) {

    install.packages('ggplot2');
    require('ggplot2');
}


NEI_Baltimore <- subset(readRDS("./data/summarySCC_PM25.rds"), fips == 24510);


NEI_long <- melt(NEI_Baltimore, id.vars = c("year", "type"), measure.vars = "Emissions");
NEI_wide <- dcast(NEI_long, year + type ~ variable, sum);


png(file = "plot3.png", width = 640, height = 480);

p <- ggplot(NEI_wide, aes(year, Emissions, group = type));
p <- p + geom_line(aes(color = type));
p <- p + ggtitle("Total" ~ PM[2.5] ~ "Emissions From All Sources By Type (Baltimore City)");
p <- p + xlab("Years");
p <- p + ylab("Total" ~ PM[2.5] ~ "Emissions");

print(p);

dev.off();
