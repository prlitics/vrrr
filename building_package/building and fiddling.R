install.packages("yaml")

##################
#Needed Libraries#
library(yaml)
library(rlang)
library(readr)
##################
##################



setwd("C:/Users/prlic/Documents/GitHub/vrrr/vrrr/")

ct<-vf_read(state = "ct", path = "D:/Data/VoterFile/CT/Data/", menu = F,
            keep_names = FALSE, keep_addresses = FALSE)


wv<-read_vf(state = "wv", vtr_file = "C:/Users/prlic/Downloads/WV 2019-03-14/WV 2019-03-14.txt")




states1<-c("hI")
states2<-c("hi","what's up?")
states3<-c()
states4<-c(1,2,3)
states5<-c(1,"pie",3)
states6 <-c("fLoRiDa")

names<-yaml["name_fields"][[1]]
yaml1<-(yaml["column_classes"][[1]])


yaml2<-yaml1[!(names(yaml1) %in% yaml["name_fields"][[1]])]
yaml3<-yaml1[!(names(yaml2) %in% yaml["address_fields"][[1]])]

nam<-names(yaml3)
vals<-unname(yaml3)

yaml<-yaml::yaml.load_file("C:/Users/prlic/Dropbox/YAML/yaml standardization/yaml files/finished yaml/connecticut.yaml")
yaml[["file_type"]]

yaml[["format"]][["separate_counties_voter_file"]]
