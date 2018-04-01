# https://www.r-bloggers.com/feature-selection-3-swarm-mentality/

qda_pso <- list(
  fit = function(x, y, ...)
  {
    ## Check to see if the subset has no members
    if(ncol(x) > 0)
    {
      mod <- train(x, y, "qda", 
                   metric = "ROC",
                   trControl = trainControl(method = "repeatedcv", 
                                            repeats = 1,
                                            summaryFunction = twoClassSummary,
                                            classProbs = TRUE))
    } else mod <- nullModel(y = y) ## A model with no predictors 
    mod
  },
  fitness = function(object, x, y)
  {
    if(ncol(x) > 0)
    {
      testROC <- roc(y, predict(object, x, type = "prob")[,1], 
                     levels = rev(levels(y)))
      largeROC <- roc(large$Class, 
                      predict(object, 
                              large[,names(x),drop = FALSE], 
                              type = "prob")[,1], 
                      levels = rev(levels(y)))  
      out <- c(Resampling = caret:::getTrainPerf(object)[, "TrainROC"],
               Test = as.vector(auc(testROC)), 
               Large_Sample = as.vector(auc(largeROC)),
               Size = ncol(x))
    } else {
      out <- c(Resampling = .5,
               Test = .5, 
               Large_Sample = .5,
               Size = ncol(x))
      print(out)
    }
    out
  },
  predict = function(object, x)
  {
    library(caret)
    predict(object, newdata = x)
  }
)
# Here is the familiar code to generate the simulated data:
  
  set.seed(468)
training <- twoClassSim(  500, noiseVars = 100, 
                          corrVar = 100, corrValue = .75)
testing  <- twoClassSim(  500, noiseVars = 100, 
                          corrVar = 100, corrValue = .75)
large    <- twoClassSim(10000, noiseVars = 100, 
                        corrVar = 100, corrValue = .75)
realVars <- names(training)
realVars <- realVars[!grepl("(Corr)|(Noise)", realVars)]
cvIndex <- createMultiFolds(training$Class, times = 2)
ctrl <- trainControl(method = "repeatedcv",
                     repeats = 2,
                     classProbs = TRUE,
                     summaryFunction = twoClassSummary,
                     ## We will parallel process within each PSO
                     ## iteration, so don't double-up the number
                     ## of sub-processes
                     allowParallel = FALSE,
                     index = cvIndex)
# To run the optimization, the code will be similar to the GA code used in the last two posts:
  
  set.seed(235)
psoModel <- psofs(x = training[,-ncol(training)],
                  y = training$Class,
                  iterations = 200,
                  functions = qda_pso,
                  verbose = FALSE,
                  ## The PSO code uses foreach to parallelize
                  parallel = TRUE,
                  ## These are passed to the fitness function
                  tx = testing[,-ncol(testing)],
                  ty = testing$Class)


