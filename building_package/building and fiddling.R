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

alabama<-vf_read(state = "al", vtr_file = "D:/Data/VoterFile/AL-2019-1/2018 Political Party Lists.txt",
                 standard_cols = FALSE )

alabama1<-vf_read(state = "al", vtr_file = "D:/Data/VoterFile/AL-2019-1/2018 Political Party Lists.txt")

al<-readr::read_delim("D:/Data/VoterFile/AL-2019-1/2018 Political Party Lists.txt",
                      delim = yaml[["delimiter"]])

wv<-vf_read(state = "wv", vtr_file = "C:/Users/prlic/Downloads/WV 2019-03-14/WV 2019-03-14.txt",
            standard_cols = FALSE)

wv_stand <- vf_read(state = "wv", vtr_file = "C:/Users/prlic/Downloads/WV 2019-03-14/WV 2019-03-14.txt")

attr(ct, 'vrrr_state')<-"ct"
attr(ct, 'blah')

states1<-c("hI")
states2<-c("hi","what's up?")
states3<-c()
states4<-c(1,2,3)
states5<-c(1,"pie",3)
states6 <-c("fLoRiDa")

names<-yaml["name_fields"][[1]]
yaml1<-(yaml["column_classes"][[1]])


test<-c("apple"= 1, "banana"= 3, "orange"= 6)
words<-c("I", "am","batman")

for (i in seq_along(test) ) {
  names(test)[[i]]<-words[[i]]

}



yaml<-yaml::yaml.load_file("C:\\Users\\prlic\\Documents\\GitHub\\vrrr\\vrrr\\state_yamls\\vf\\alabama.yaml")
yaml[["file_type"]]

yaml[["format"]][["separate_counties_voter_file"]]
all<-alabama.yaml
