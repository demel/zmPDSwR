# informalexample:5_2.1.2 
# informalexample:5 : Loading data into R : Working with data from files : Using R on less structured data 
for(i in 1:(dim(d))[2]) {             	# Note: 1 
   if(class(d[,i])=='character') {
      d[,i] <- as.factor(as.character(mapping[d[,i]]))  	# Note: 2 
   }
}

# Note 1: 
#    
#   (dim(d))[2] is the number of columns in the data frame d 
#    

# Note 2: 
#    
#   Note that the indexing operator [] is vectorized. Each step in the for loop remaps an 
#   entire column of data through our list. 
#    
