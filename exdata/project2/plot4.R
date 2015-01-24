
if (!require('reshape2')) {

    install.packages('reshape2');
    require('reshape2');
}

if (!require('ggplot2')) {

    install.packages('ggplot2');
    require('ggplot2');
}


SCC       <- readRDS("./data/Source_Classification_Code.rds");
SCC_Coal1 <- SCC[grepl("Coal", SCC$Short.Name), 1];
SCC_Coal2 <- SCC[grepl("Coal", SCC$EI.Sector), 1];
SCC_Coal3 <- SCC[grepl("Coal", SCC$SCC.Level.Three), 1];
SCC_Coal4 <- SCC[grepl("Coal", SCC$SCC.Level.Four), 1];
SCC_Coal  <- union(union(union(SCC_Coal1, SCC_Coal2), SCC_Coal3), SCC_Coal4);

NEI_Coal <- subset(readRDS("./data/summarySCC_PM25.rds"), SCC %in% SCC_Coal);


NEI_long <- melt(NEI_Coal, id.vars = "year", measure.vars = "Emissions");
NEI_wide <- dcast(NEI_long, year ~ variable, sum);


png(file = "plot4.png", width = 640, height = 480);

p <- ggplot(NEI_wide, aes(year, Emissions));
p <- p + geom_line(color = "red");
p <- p + ggtitle("Total" ~ PM[2.5] ~ "Emissions By Coal Combustion-Related Sources (USA)");
p <- p + xlab("Years");
p <- p + ylab("Total" ~ PM[2.5] ~ "Emissions");

print(p);

dev.off();

# Alternative approach - just select Coal from EI.Sector
# 
# SCC_Coal <- SCC[grepl("Coal", SCC$EI.Sector), 1];
