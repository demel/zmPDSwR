# informalexample:2_2.1.1 
# informalexample:2 : Loading data into R : Working with data from files : Working with well-structured data from files or URLs 
uciCar <- read.table(  	# Note: 1 
   'http://www.win-vector.com/dfiles/car.data.csv', 	# Note: 2 
   sep=',', 	# Note: 3 
   header=T 	# Note: 4 
   )

# Note 1: 
#    
#   Command to read from a file or URL and store the result in a new data frame object 
#   called 
#   uciCar. 
#    

# Note 2: 
#   Filename or URL to get the data 
#   from. 

# Note 3: 
#   Specify the column or field separator as a comma 

# Note 4: 
#   Tell R to expect a header line that defines the data column 
#   names 
