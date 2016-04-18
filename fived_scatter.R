library(ggplot2) 
set.seed(123)

dat <- data.frame(status = rep(c("Single", "Married"), each=10),     # conditional categorical variables
                  height = 41:60 + rnorm(20,sd=3),         			 # variable for the x-axis
                  weight = 41:60 + rnorm(20,sd=3),		      		 # variable for the y-axix
                  Education = rep(4:8,4),			              	 # A numerical but categorical variable determines the size of points
                  gender = rep(c("Male", "Female"), each=2))         # Another categorical variable gender to display in the plot)
                  
dat.plot <- ggplot(dat, aes(x=height,             #  height as x-axis
		           y=weight, 			      	  #  weight as y-axix
		           shape=status,		          #  shape denotes marital status 
                   color = gender, 		          #  color denotes the gender
		            size = Education))		      #  size denotes the education


dat.plot <- dat.plot + geom_point()

dat.plot <- dat.plot +  xlab("Height") 						    # add xlabel to image

dat.plot <- dat.plot +  ylab("Weight") 							# add ylabel to immage
dat.plot <- dat.plot +  ggtitle("Five Dimensional Scatterplot") # add title to image


# Put bottom-left corner of legend box in bottom-left corner of graph
dat.plot <- dat.plot + theme(legend.position=c(0,0), #position the legend 
       						 legend.justification=c(0,0))
# bottom-left is 0,0; top-right is 1,1


dat.plot <- dat.plot +  theme(legend.position=c(0,0.3),
                              legend.justification=c(0,0), 
                              panel.background = element_rect(fill = "white",          #background color of the plot
                                                              colour = "black",        #color of the rectange around plot
                                                              size = 1, 
                                                              linetype = "solid"),
                              axis.title=element_text(size=18,face="bold"),             # fontface and font size of both X and Y labels
                              axis.text=element_text(size=14),                          # ticklabels of of both X and Y axes
                              plot.title = element_text(size = rel(2), 
                              face="bold", colour = "black"))  # Title of the plot 
 # size of the line and line type of rectangle around plot 
 
 
dat.plot <- dat.plot + scale_color_discrete(name ="Gender", labels=c("Female", "Male")) 
dat.plot <- dat.plot + scale_shape_discrete(name="Marital\nStatus", labels=c("Married", "Single" ))

print(dat.plot)
