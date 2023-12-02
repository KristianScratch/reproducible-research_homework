#---
title: "random_walk"
Author:"Anon"
date: "2023-12-02"
#---

#------------------------------------------------------------------------
# (1) Install and load any necessary packages

install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("ragg")
library(ragg)

#------------------------------------------------------------------------
# (2) Read the data and view it 

Cui_data <- read.csv("/cloud/project/question-5-data/Cui_etal2014.csv")

head(Cui_data)
print(Cui_data)

#------------------------------------------------------------------------
# (3) The relationship can be linearised via a log-log transformation (log of both axis)

# Create a data frame with only the variables we are interested in, and with both transformed by log()
loglog_Cui_data <- Cui_data %>%
  mutate(Virion_vol_log = log(Virion.volume..nm.nm.nm.)) %>%
  mutate(Genome_l_log = log(Genome.length..kb.))

#Check it is correct
loglog_Cui_data

#------------------------------------------------------------------------
# (4) Parameterising a model (B and a), and checking Reproducability.

# the paper we are reproducing proposes the relationship between genome size and virion volume as V = B*L ^a
# AkA Volume = Scaling factor * Genome Length ^exponent

# By log-log transforming, we have made a linear relationship of this which can be defined as:
# ln(V) = ln(B)  + a * ln(L).      *which is in the format of 
# y     =   c    + m * x

#In this format we can run a linear model
dsDNA_loglog_model <- lm(Virion_vol_log ~ Genome_l_log, loglog_Cui_data)

#and view the results
summary(dsDNA_loglog_model)

# the intercept is equivalent to log(ScalingFactor). So, B = e^7.0748
B <- exp(7.0748) # AKA the scaling factor is 1181.807
# p = 2.28e-10 so this is significant

# the gradient is equivalent to a. So, a = 1.5152
a <- 1.5152 
# p = 6.44e-10 so this is significant 

# The paper gave these values as 1182 and 1.52 respectively, so the work is reproducible.

#------------------------------------------------------------------------
# (5) Reproducing the Figure

#Plot the transformed data and apply a linear model smoother
dsDNA_loglog_graph <- ggplot(data= loglog_Cui_data,
       aes(x= Genome_l_log, y=Virion_vol_log))+
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x= "log[Genome length (kb)]", y= "log[Virion Volume (nm3)]") +
  theme_bw()

#View it
dsDNA_loglog_graph

#save it
agg_png("question-5-data/Replicated_Plot.png", 
        width   =  35, 
        height  =  30, 
        units   =  "cm", 
        res     =  175, 
        scaling =  2.5)
dsDNA_loglog_graph
print(dsDNA_loglog_graph)
dev.off()

#------------------------------------------------------------------------
# (6) What is the volume of a 300kb dsDNA virion?

# ln(V) = ln(B)  + a * ln(L).      *which is in the format of 
# y     =   c    + m * x

log_q5e_answr <- log(B) + (a*log(300)) # ln(v) at 300kb is 15.71717

q5e_answr <- exp(log_q5e_answr)
q5e_answr

# V at 300kb is 6697007nm3



