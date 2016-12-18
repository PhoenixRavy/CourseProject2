#Q6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
# sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
setwd("~/Coursera/Assignment4_20161218")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# specify the years
NEI_year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# For specific fips and type (subset) : Baltimore City MD and Los Angeles (CA)
MD_onroad <- subset(NEI, fips== "24510" & type== 'ON-ROAD')
CA_onroad <- subset(NEI, fips== "06037" & type== 'ON-ROAD')

# Summarize

sum_em_baltimore <- aggregate(MD_onroad[, 'Emissions'], by=list(MD_onroad$year), sum)
col_names_sum_em_baltimore 
colnames(sum_em_baltimore)<- c('year', 'Emissions')
sum_em_baltimore$City <- paste(rep('MD', 4))


sum_em_losangeles <- aggregate(CA_onroad[, 'Emissions'], by=list(CA_onroad$year), sum)
colnames(sum_em_losangeles) <- c('year', 'Emissions')
CA.DF$City <- paste(rep('CA', 4))

DF <- as.data.frame(rbind(MD.DF, CA.DF))


# Generate the graph in the same directory as the source code
png('~/Exploratory_Data_Analysis/Assignment_2/plot6.png')

ggplot(data=DF, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
    ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + 
    ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ City) + 
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))

dev.off()

#####
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland
# Los Angeles County, California
MD.onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
CA.onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregate
MD.DF <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.DF) <- c('year', 'Emissions')
MD.DF$City <- paste(rep('MD', 4))

CA.DF <- aggregate(CA.onroad[, 'Emissions'], by=list(CA.onroad$year), sum)
colnames(CA.DF) <- c('year', 'Emissions')
CA.DF$City <- paste(rep('CA', 4))

DF <- as.data.frame(rbind(MD.DF, CA.DF))

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time 
# in motor vehicle emissions?

# Generate the graph in the same directory as the source code
png('~/Exploratory_Data_Analysis/Assignment_2/plot6.png')

ggplot(data=DF, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
    ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland') + 
    ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + facet_grid(. ~ City) + 
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1))

dev.off()
