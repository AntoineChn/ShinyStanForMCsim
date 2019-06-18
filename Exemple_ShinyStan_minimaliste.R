# Install & import packages ------------------------------------------------

# install.packages("shinystan") 
library(shinystan)

# Import and analyse MCMC Outputs -----------------------------------------

my_mcmc1 = read.delim("./data/steatosis.mcmc_A.1.1.out") 
my_mcmc2 = read.delim("./data/steatosis.mcmc_A.2.1.out")

# Check head 
head(my_mcmc1)
# str(my_mcmc1)

# head(my_mcmc2)
# str(my_mcmc2)

# Remove the
# - First col <== iter is the iteration index. It does not correspond to any simulated variable 
my_mcmc.rs1 = as.matrix(my_mcmc1[, -1] ) 
my_mcmc.rs2 = as.matrix(my_mcmc2[, -1] )

# Create a Shinystan Object
# - First row <== start point from prior distribution. to be considered as warmup iteration(s) 
my_shinystan.obj = as.shinystan(X = list(my_mcmc.rs1,
                                         my_mcmc.rs2),
                                warmup = 1)

# Launch shiny interface for the analysis of MCMC simulation
launch_shinystan(my_shinystan.obj)
