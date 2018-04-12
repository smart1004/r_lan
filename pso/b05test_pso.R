# 
# hydroPSO package hydroPSO (Zambrano-Bigiarini 2013) implements a particle swarm optimization algorithm; 
# its development was motivated by the need to fit environmental models, 
# though it is a generalpurpose optimizer.

# Enhanced Particle Swarm Optimisation algorithm
# 
# Description
# 
# State-of-the-art version of the Particle Swarm Optimisation (PSO) algorithm (SPSO-2011 and SPSO-2007 capable). hydroPSO can be used as a replacement for optim, but its main focus is the calibration of environmental and other real-world model codes. Several fine-tuning options and PSO variants are available to customise the PSO engine to different calibration problems.
# 
# Usage
# 
# hydroPSO(par, fn= "hydromod", ..., 
#          method=c("spso2011", "spso2007", "ipso", "fips", "wfips", "canonical"),
#          lower=-Inf, upper=Inf, control=list(), 
#          model.FUN=NULL, model.FUN.args=list() )

