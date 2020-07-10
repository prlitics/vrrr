library(yaml)

# function will take in a state 
check_yaml <- function(state){
  # check if given a character vector
  if (typeof(state)=='character'){
    # continue 
    current_dir <- getwd()
    setwd('C:/Users/jenna/Documents/GitHub/vrrr/yaml_files')
    # paste .yaml on the backend of it 
    state_yaml <- paste0(tolower(state),".yaml")
    
    # check_state should correct fl to florida etc. 
    # add this to check_state later/issue it ?
    
    # access a list of all YAMLs in our repo
    # check if this state is in it/exists
      if(file.exists(state_yaml)){
        print("File exists, proceed")
        called_yaml<- yaml:: yaml.load_file(state_yaml)
      
        setwd(current_dir)
        called_yaml
      }
      else{
        stop("State input is not recognized. ")
      }
    }
  else{
    stop("Please insert a character string with your state's name")
  }
}


check_yaml('florida')
