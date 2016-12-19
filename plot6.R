#Q6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
# sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
setwd("~/Coursera/Assignment4_20161218")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#load library ggplot
library(ggplot2)

em_MD <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"),]
em_MD_aggr <- aggregate(Emissions ~ year, data=em_MD, FUN=sum)

# Get Los Angeles emissions from motor vehicle sources
em_CA <- NEI[(NEI$fips == "06037") & (NEI$type == "ON-ROAD"),]
em_CA_aggr <- aggregate(Emissions ~ year, data=em_CA, FUN=sum)

em_MD_aggr$County <- "Baltimore City, MD"
em_CA_aggr$County <- "Los Angeles County, CA"
em_MD_CA <- rbind(em_MD_aggr, em_CA_aggr)

# Create plot
png("plot6.png")

ggplot(em_MD_CA, aes(x=factor(year), y=Emissions, fill=County)) + geom_bar(aes(fill=year),stat="identity") + 
    facet_grid(County  ~ ., scales="free") + xlab("Year") + ylab("PM2.5 total mission (kilotons)") + 
    ggtitle(expression("Motor vehicle total emission in Baltimore (MD) and Los Angeles (CA)"))

dev.off()
