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





vrrr_read(states = states1)






check_state<-function(states){
  if (typeof(states)=="character"){
    num_states<-length(states)
      if(num_states > 0){
       
        for(i in states){
            if(i %in% state_list){
              print("Good test!")
            } else {
              stop("Your list of states contains at least one state that we do not have in our YAML directory")
          }
        }
      } else {
        stop("Please enter at least one state or state postal abbreviation.")
    }
  }else{
    stop("Please insert a character list of at least one state or state postal abbreviation.")
  }
}




yaml<-yaml.load_file("C:/Users/prlic/Dropbox/YAML/yaml standardization/yaml files/finished yaml/alaska.yaml")







