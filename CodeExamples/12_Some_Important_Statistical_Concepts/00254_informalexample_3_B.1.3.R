# informalexample:3_B.1.3 
# informalexample:3 : Some Important Statistical Concepts : A few important distributions : The binomial distribution 

 # use rbinom to simulate flipping a coin of probability p N times

p75 = 0.75 # a very unfair coin (mostly heads)
N = 1000  # flip it several times
flips_v1 = rbinom(N, 1, p75)

# actually,  what I usually do is use runif:
# the probability that a uniform random number from [0 1)
# is less than p is exactly p. So "less than p" is "heads".
flips_v2 = as.numeric(runif(N) < p75) 

prettyprint_flips = function(flips) {
  outcome = ifelse(flips==1, "heads", "tails")
  table(outcome)
}

prettyprint_flips(flips_v1)
# outcome
# heads tails 
# 756   244 
prettyprint_flips(flips_v2)
# outcome
# heads tails 
# 743   257           
                    
