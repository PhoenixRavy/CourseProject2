#Q3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

setwd("~/Coursera/Assignment4_20161218")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

#Baltimore's subset to fip.
NEI_baltimore <- NEI[ NEI$fips=="24510", ]

#for these specific years
NEI_baltimore$year <- factor(NEI_baltimore$year, levels=c('1999', '2002', '2005', '2008'))

#create plot
png('plot3.png', width=800, height=500)

ggplot(data=NEI_baltimore, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
    geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
    ylab(expression(paste('Log(', ' emissions', ' of PM'[2.5],')'))) + xlab('Year') + 
    ggtitle('Emissions per type in Baltimore City (Maryland)') +
    geom_jitter(alpha=0.10)

dev.off()
