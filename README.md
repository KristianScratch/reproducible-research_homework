# Reproducible research: version control and R

\# INSERT ANSWERS HERE #

## Q1, 2 and 3: https://github.com/KristianScratch/logistic_growth

## Q4

a) We observe that the function creates a dataframe of 2D coordinates (X and Y) and and finds these for each time that we can specify the number of time steps (we used 500 for both plots). The starting position is set at [0,0] but each time step takes a 'leap' of a defined distance ('h', which we set at a constant 0.25) at a random angle. This simulates a random 2D walk. The plots show this 'random walk' with time shown as colour from black to blue. We can see that the two data sets are extremely different, plot1 going largely west from start, and plot2 going south and ending east of start. They simulate brownian motion, but the plots I described are not reproducible because every time you create the dataframe (i.e. on a different computer) the outcome is different

b) A random seed is the starting value for a Psuedo-random generator to produce its output. PRNG's use a conserved method to generate the random outputs. This means that the starting point for the algorithm to make a random number is important, this starting point is the random seed. If we put the same random seed in twice, we should thus get the same output from the generator. Setting seeds means that code using this kind of RNG can be replicatable and aid reproduciblility.

c) see edited "question-4-code/randomwalk.R"

d) This poto does not show all the history as I worked for a while before commiting/ See image below >

![Commit History](https://github.com/KristianScratch/reproducible-research_homework/blob/main/images/commit_hist_q4d.png)

## Q5

a) the dsDAN virus table in the Cui et al data has 33 rows and 13 columns. 

To see this code, view the answer script at: "/question-5-data/Question5Answer.R" section (2).

b) The best transformation for this data, where both of the variables we are interested in are exponential in nature, is a log log transformation (where both x and y axis are log transformed). 

To see this code, view the answer script at: "/question-5-data/Question5Answer.R" section (3).

c) We can find the Scaling factor (B) and the exponent (a) from a linear model of this ransformed data: lm(Virion_vol_log ~ Genome_l_log, loglog_Cui_data). We can deduce that the a = 1.5152 and B = 1181.807. The paper gave these values as 1182 and 1.52 respectively, so the we have succesfully reproduced the work.

To see this code, view the answer script at: "/question-5-data/Question5Answer.R" section (4).

d) See Image below >

![Replicated Figure](https://github.com/KristianScratch/reproducible-research_homework/blob/main/question-5-data/Replicated_Plot.png)

To see this code, view the answer script at: "/question-5-data/Question5Answer.R" section (5).

## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
