# example:1_10.2.1 
# example:1 : Documentation and Deployment : Using knitr to produce milestone documentation : What is knitr? 

# Simple knitr Markdown example 	# Note: 1 

Two examples:

* plotting
* calculating

Plot example:
```{r plotexample, fig.width=2, fig.height=2, fig.align='center'} 	# Note: 2 
library(ggplot2) 	# Note: 3 
ggplot(data=data.frame(x=c(1:100),y=sin(0.1*c(1:100)))) +
   geom_line(aes(x=x,y=y))
``` 	# Note: 4 

Calculation example: 	# Note: 5 
```{r calcexample} 	# Note: 6 
pi*pi
```


# Note 1: 
#   Markdown text and formatting 

# Note 2: 
#   Knitr chunk open with option 
#   assignments 

# Note 3: 
#   R code 

# Note 4: 
#   Knitr chunk close 

# Note 5: 
#   More Markdown text 

# Note 6: 
#   Another R code chunk 
