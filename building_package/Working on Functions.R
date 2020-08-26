
setwd("C:/Users/prlic/Documents/GitHub/vrrr/vrrr/")

devtools::document()

usethis::use_data(state_list, state_key, alaska.yaml, colorado.yaml,
                  connecticut.yaml, delaware.yaml, florida.yaml, georgia.yaml,
                  idaho.yaml, iowa.yaml, kansas.yaml, montana.yaml, newyork.yaml,
                  newjersey.yaml, newyork.yaml, northcarolina.yaml, oklahoma.yaml,
                  oregon.yaml, rhodeisland.yaml, southdakota.yaml, utah.yaml,
                  vermont.yaml, washington.yaml, westvirginia.yaml, wyoming.yaml, internal = TRUE, overwrite = TRUE)


setwd("C:\\Users\\prlic\\Documents\\GitHub\\vrrr\\vrrr\\state_yamls\\vf")
yamls<-list.files()
for (i in yamls) {
  assign(i, yaml::yaml.load_file(i))

}
