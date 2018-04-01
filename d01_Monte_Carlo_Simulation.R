# Monte Carlo Simulation with comments

R   <-   5000   # set 5,000 replications
mu   <-   10   # set mu to 10
sdev   <-   2   # set standard deviation to 2
N   <-   c ( 5 ,   30 ,   60 )   # define 3 sample size conditions

# create a null matrix (with R rows, and 
# 3 columns, which only contains zeroes) 
# to store output
res   <-   matrix ( 0 , R,   3 )   

colnames (res)   <-   N   # name the columns (5, 30, 60)

set.seed ( 77 )   # Set the random generator seed to make analysis replicable

for (i  in  N){      # As N is a vector, i will take on values       
  # 5, 30, and 60, across the 3 iterations             
  for (r   in   1 : R){   # 1:R creates a vector 1,2,3,...,R                     
    # generate random data                                                                  
    # from a normal distribution with set mean and sd                    
        dat  <-   rnorm ( n   = i,   mean   = mu,   sd   = sdev)   
    # analyse, returning the                                         
    # mean of dat and placing it in the results matrix                                        
    # on row r and in either column 5, 30, or 60   
    res  [r,   as.character (i)] <- mean (dat) 
  }   
}


apply (res,   2,  mean)   # summarise by calculating the mean for 
# each column

apply (res,   2,  sd)     # summarise by calculating the standard
# deviation for each column

