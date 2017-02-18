sessionInfo()
file_ext("file.com")
tools::file_ext("file.com")
sessionInfo()


states %>%
  filter(!duplicated(.[["abb"]]))
         
# see http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html
states <- map_data("state")

ggplot(data = states) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(1.3) +
  guides(fill=FALSE)  # do this to leave off the color legend

#also see https://www.gislounge.com/creating-administrative-maps-using-r/ 
  
# see http://www.arilamstein.com/open-source/choroplethr/us-state-choropleths/

library(choroplethrMaps)

?state.regions
data(state.regions)
head(state.regions)

library(choroplethr)

?df_pop_state
data(df_pop_state)

?state_choropleth
state_choropleth(df_pop_state)

# also see https://uchicagoconsulting.wordpress.com/tag/r-ggplot2-maps-visualization/



# other code to play with

crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
crimesm <- reshape2::melt(crimes, id = 1)
states_map <- map_data("state")

ggplot(crimes, aes(map_id = state)) +
  geom_map(aes(fill = Murder), map = states_map) +
  expand_limits(x = states_map$long, y = states_map$lat)
         