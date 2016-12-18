#Q4.Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
setwd("~/Coursera/Assignment4_20161218")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Combustion of coal other related sources
SCC_coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge the tables
datamerge <- merge(x=NEI, y=SCC_coal, by='SCC')
merge_sum <- aggregate(datamerge[, 'Emissions'], by=list(datamerge$year), sum)
colnames(merge_sum) <- c('Year', 'Emissions')

#create plot
png('plot4.png', width=800, height=500)

ggplot(data=merge_sum, aes(x=Year, y=Emissions/1000)) + 
    geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
    ylab(expression(paste('PM', ''[2.5], ' (kilotons)'))) + ggtitle(expression('Total emissions of PM'[2.5])) + 
    geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=0.5, vjust=0.5)) +
    theme(legend.position='none') + scale_colour_gradient(low='gray', high='orange')

dev.off()
