install.packages("yaml")

library(yaml)



vrrr_read <- function(path=getwd(), states, vtr_file=T, standard_columns = T, recode_vals = T) {
  
  check_state(states = states)
  
  print(path)

  
}



states1<-c("hi")
states2<-c("hi","what's up?")
states3<-c()
states4<-c(1,2,3)
states5<-c(1,"pie",3)





vrrr_read(states = states4)






check_state<-function(states){
  if (typeof(states)=="character"){
    num_states<-length(states)
      if(num_states > 0){
        state_list<-c("alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut",
                      "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa",
                      "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan",
                      "minnesota", "mississippi","missouri","montana","nebraska","nevada","new hampshire",
                      "newhampshire", "new jersey", "newjersey", "new mexico", "newmexico", "new york", 
                      "newyork", "north carolina","northcarolina", "north dakota", "northdakota","ohio",
                      "pennsylvania", "rhode island", "rhodeisland", "south carolina", "southcarolina",
                      "south dakota", "southdakota", "tennessee", "texas", "utah", "vermont", "virginia",
                      "washington", "west virginia", "westvirginia", "wisconsin", "wyoming", "al", "ak",
                      "az", "ar", "ca", "co", "ct", "de", "fl", "ga", "hi", "id", "il", "in", "ia","ks",
                      "ky","la","me","md","ma","mi","mn","ms","mo","mt","ne","nv","nh","nj","nm","ny",
                      "nc","nd", "oh", "ok","or","pa","ri","sc","sd","tn","tx","ut","vt","va","wa","wv",
                      "wi","wy")
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







