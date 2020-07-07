install.packages("yaml")

library(yaml)



vrrr_read <- function(path=getwd(), states, vtr_file=T, standard_columns = T, recode_vals = T) {
  source("C:/Users/prlic/Documents/GitHub/vrrr/building_package/helpful_lists.R")
  check_state(states = states)
  
  print(path)

  
}



states1<-c("hi")
states2<-c("hi","what's up?")
states3<-c()
states4<-c(1,2,3)
states5<-c(1,"pie",3)
states6 <-c("ak","florida")





vrrr_read(states = states1)






check_state<-function(states){
# Check if given a character vector
  if (typeof(states)=="character"){
    num_states<-length(states)
    
      if(num_states == 1){
        #Check if given a state that is in the list of available state YAMLs
       if(states %in% state_list){
         #If so, yay!
        
 
               } else { 
         stop("Your state input is either not a state in our library or is not in a recognized format.")
         }
      
      } else if(num_states > 1){
        #Looping through states if presented character vector.
        for(i in states){
          #Checking if each state is in the list of available state YAMLs
          if(i %in% state_list){
           #Checking if each state is on the list of county compilation-states.
            #Unfortunately, I can't think of a way to make multiple states work simultaneously with county compilation
            #without making this stupidly unweildly. I advise just asking the user to run the command multiple times in this case.
            if(i %in% county_comp_list){
              stop("One of your states must be aggregated from county-level data. vrrr_read can only read-in multiple states simultaneously if none of them require aggregation.")
            } 
            
          } else {
          
            stop("Your list of states contains at least one state that we do not have in our YAML directory or is not in a recognized format.")
        }
     
        }
        
      } else {
        
        stop("Please enter at least one state or state postal abbreviation.")
      }
      
    
  } else{

        stop("Please insert a character list of at least one state or state postal abbreviation.")
  }
}




yaml<-yaml.load_file("C:/Users/prlic/Dropbox/YAML/yaml standardization/yaml files/finished yaml/alaska.yaml")







