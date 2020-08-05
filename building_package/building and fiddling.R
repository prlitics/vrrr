install.packages("yaml")

##################
#Needed Libraries#
library(yaml)
library(rlang)
library(readr)
##################
##################


vrrr_read <- function(path=getwd(), state, vtr_file = NULL, standard_columns = T, recode_vals = T) {
  source("C:/Users/prlic/Documents/GitHub/vrrr/building_package/functions/helpful_lists.R")
  check_state(states = state)
  
  state_yaml<-check_yaml(state=state)
  
  load_state(path=path, vtr_file = vtr_file, state_yaml = state_yaml)
  
  
}

ct<-read_vf(state = "ct", path = "D:/Data/VoterFile/CT/Data/")

wv<-read_vf(state = "wv", vtr_file = "C:/Users/prlic/Downloads/WV 2019-03-14/WV 2019-03-14.txt")




states1<-c("hI")
states2<-c("hi","what's up?")
states3<-c()
states4<-c(1,2,3)
states5<-c(1,"pie",3)
states6 <-c("fLoRiDa")





yaml<-yaml.load_file("C:/Users/prlic/Dropbox/YAML/yaml standardization/yaml files/finished yaml/colorado.yaml")
yaml[["file_type"]]

yaml[["format"]][["separate_counties_voter_file"]]