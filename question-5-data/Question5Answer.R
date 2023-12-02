#---
title: "random_walk"
Author:"Anon"
date: "2023-12-02"
#---

#------------------------------------------------------------------------
# Install and load any nescesary packages

install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)

#------------------------------------------------------------------------
#Read the data and view it 

Cui_data <- read.csv("/cloud/project/question-5-data/Cui_etal2014.csv")

head(Cui_data)
print(Cui_data)

#------------------------------------------------------------------------
#The relationship can be linearised via a log-log transfomration (log of both axis)

# Create a dataframe with only the variables we are interested in, and with both trasnformed by log()
loglog_Cui <- data.frame(
  genome_l_kb = log(Cui_data$Genome.length..kb.),
  virion_volume_nm3 = log(Cui_data$Virion.volume..nm.nm.nm.)
)

#Chack it is correct
loglog_Cui


