# example:1_10.4.1 
# example:1 : Documentation and Deployment : Deploying models : Deploying models as R http services 

library(Rook)  	# Note: 1 
load('thRS500.Rdata') 	# Note: 2 
library(randomForest) 	# Note: 3 
numericPositions <- sapply(buzztrain[,varslist],is.numeric) 	# Note: 4 

modelFn <- function(env) { 	# Note: 5 
   errors <- c()
   warnings <- c()
   val <- c()
   row <- c()
   tryCatch(
      {
         arg <- Multipart$parse(env) 	# Note: 6 
         row <- as.list(arg[varslist])
         names(row) <- varslist
         row[numericPositions] <- as.numeric(row[numericPositions])
         frame <- data.frame(row)
         val <- predict(fmodel,newdata=frame)
      },
      warning = function(w) { message(w)
         warnings <<- c(warnings,as.character(w)) },
      error = function(e) { message(e)
         errors <<- c(errors,as.character(e)) }
   )
   body <- paste( 	# Note: 7 
      'val=',val,'\n',
      'nerrors=',length(errors),'\n',
      'nwarnings=',length(warnings),'\n',
      'query=',env$QUERY_STRING,'\n',
      'errors=',paste(errors,collapse=' '),'\n',
      'warnings=',paste(warnings,collapse=' '),'\n',
      'data row','\n',
      paste(capture.output(print(row)),collapse='\n'),'\n',
      sep='')
   list(
      status=ifelse(length(errors)<=0,200L,400L),
      headers=list('Content-Type' = 'text/text'),
      body=body )
}


s <- Rhttpd$new() 	# Note: 8 
s$add(name="modelFn",app=modelFn) 	# Note: 9 
s$start() 	# Note: 10 
##starting httpd help server ... done
##
##Server started on host 127.0.0.1 and port 11953 . App urls are:
##
##      http://127.0.0.1:11953/custom/modelFn  	# Note: 11 


# Note 1: 
#   Load the rook http server library. 

# Note 2: 
#   Load the saved buzz workspace (includes the random 
#   forests model). 

# Note 3: 
#   Load the random forests library (loading the 
#   workspace does not load the library). 

# Note 4: 
#   Determine which variables are numeric (in the rook 
#   server everything defaults to character). 

# Note 5: 
#   Declare the modeling service. 

# Note 6: 
#   This block does the actual work: parse data and 
#   apply the model. 

# Note 7: 
#   Format results, place in a list and 
#   return. 

# Note 8: 
#   Start a new rook http service. 

# Note 9: 
#   Register our model function as a http 
#   service. 

# Note 10: 
#   Start the http server. 

# Note 11: 
#   This is the URL the service is running 
#   at. 
