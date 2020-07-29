install.packages("yaml")
library(yaml)



vrrr_read <- function(path=getwd(), state, vtr_file = NULL, standard_columns = T, recode_vals = T) {
  source("C:/Users/prlic/Documents/GitHub/vrrr/building_package/functions/helpful_lists.R")
  check_state(states = state)
  
  state_yaml<-check_yaml(state=state)
  
  load_state(path=path, vtr_file = vtr_file, state_yaml = state_yaml)
  
  
}



states1<-c("hI")
states2<-c("hi","what's up?")
states3<-c()
states4<-c(1,2,3)
states5<-c(1,"pie",3)
states6 <-c("fLoRiDa")

setwd("D:/Data/VoterFile/CT/Data/")
list.files(pattern = yaml[["file_type"]])


vrrr_read(state = "ct", path = "D:/Data/VoterFile/CT/Data/")

ct<-vrrr_read(state = "ct", path = "D:/Data/VoterFile/CT/Data/")




yaml<-yaml.load_file("C:/Users/prlic/Dropbox/YAML/yaml standardization/yaml files/finished yaml/connecticut.yaml")
yaml[["file_type"]]

yaml[["format"]][["separate_counties_voter_file"]]