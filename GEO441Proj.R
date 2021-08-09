`2019` <- read.csv("~/Downloads/2019.csv", header=FALSE)
library(dplyr)
library(tidyverse)
df <- subset(`2019`, V3 == "PRCP", select = c("V1","V2","V3","V4"))

#Imported raw coordinate datafile to excel first to capture all features first
Coordinates <- read_excel("GEO441/Coordinates.xlsx")

USdf -> df %>%
  select(V1,V2,V3,V4) %>%
  filter(str_detect(V1, "US")) %>%
  
write.csv(USdf,"/Users/mike/GEO441/Precip1.csv", row.names=FALSE)

mergedDf <- merge(USdf,US_Coordinate, by.x="V1", by.y="StationID")

GroupDf <- mergedDf %>%
  group_by(mergedDf$V1, mergedDf$V2) %>%
  summarize(mean_precip = mean(mergedDf$V4))