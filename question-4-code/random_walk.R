#---
title: "random_walk"
Author:"Anon"
date: "2023-12-02"
#---

#This R Script Outlines how we produced 2 brownian simulations from Psuedo-Random-Number-Genoration. 
#These simulations are reproducible because we use defined seeds from R.

#------------------------------------------------------------------------

## (1) Install and load packages If necessary

install.packages("ggplot2")
install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

#------------------------------------------------------------------------

## (2) Create function for randomization, and call it "brownian_simulator"

# This function has two parameters. The number of time steps in the simulation (n_steps)
# and the seed number. In order to reproduce our results, use seed 4 and 8 for simulation 1 and 2 respectively

#Create the function as follows
brownian_simulator  <- function (n_steps, seed_number) {
  
  set.seed(seed_number) #sets the random seed desired
  
  simulation <- data.frame(x = rep(NA, n_steps), y = rep(NA, n_steps), time = 1:n_steps) #opens the dataframe with 2D coordinates over time
  
  simulation[1,] <- c(0,0,1) #sets the starting position in the frame as {0,0} and t=0
  
  for (i in 2:n_steps) { 
    
    h <- 0.25
    
    angle <- runif(1, min = 0, max = 2*pi)
    
    simulation[i,1] <- simulation[i-1,1] + cos(angle)*h
    
    simulation[i,2] <- simulation[i-1,2] + sin(angle)*h
    
    simulation[i,3] <- i
    
  }
  
  return(simulation) #the for loop is an algorythm for randomisation
  
}

#------------------------------------------------------------------------

## (3) Create the simulated results for the two tests using this function
data1 <- brownian_simulator(500, 4)
data2 <- brownian_simulator(500, 8)

#------------------------------------------------------------------------

## (4) Then use ggplot to plot both of these simulations in 2D space

#For simulation 1:
simulation_1 <- ggplot(aes(x = x, y = y), data = data1) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

#For simulation 2:
simulation_2 <- ggplot(aes(x = x, y = y), data = data2) +
  
  geom_path(aes(colour = time)) +
  
  theme_bw() +
  
  xlab("x-coordinate") +
  
  ylab("y-coordinate")

#You can view them by calling the object
simulation_1
simulation_2

#------------------------------------------------------------------------

## (5) Compare the two simulations side by side. 

#The use of set seedsmeans that this outcome from this code is reproducible
#To plot side by side use:

grid.arrange(simulation_1, simulation_2, ncol=2)
