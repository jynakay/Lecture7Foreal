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
         
# =======================

library(DiagrammeR)

grViz("
      
digraph boxes_and_circles{

# add node statement
  node [shape=circle]
  A; B; C

  node [shape=box]
  1; 2; 3

# add edge statements
  B->A; B->1; B->2; C->B; C->3

}
      
")

# see more at http://rich-iannone.github.io/DiagrammeR/graphviz_and_mermaid.html

grViz("
digraph dot {
      
      graph [layout = dot]
      
      node [shape = circle,
      style = filled,
      color = grey]
      
      node [fillcolor = red]
      a
      
      node [fillcolor = green]
      b c d
      
      node [fillcolor = orange]
      
      edge [color = grey]
      a -> {b c d}
      b -> {e f g h i j}
      c -> {k l m n o p}
      d -> {q r s t u v}
      }")


grViz("
      digraph dot {
      
      graph [rankdir = LR]
      graph [layout = dot]
      
      node [shape = circle,
      style = filled,
      color = grey]
      
      node [fillcolor = red]
      S1 S2 S3
      
      node [fillcolor = green]
      c1 c2 c3 c4 c5 c6 c7 c8
      
      node [fillcolor = orange]
      
      edge [color = grey]
      S1 -> {c1 c2}
      S2 -> {c3 c4 c5}
      S3 -> {c6 c7 c8}
      c1 -> {p1 p2 p3 p4}
      c2 -> {p1 p2 p3 p4}
      c3 -> {p1 p2 p3 p4}
      c4 -> {p1 p2 p3 p4}
      c5 -> {p1 p2 p3 p4}
      c6 -> {p1 p2 p3 p4}
      c7 -> {p1 p2 p3 p4}
      c8 -> {p1 p2 p3 p4}
      }")



grViz("
      digraph dot {
      
      graph [layout = dot]
      
      node [shape = circle,
      style = filled,
      color = grey]
      
      node [fillcolor = red]
      S1 S2 S3
      
      node [fillcolor = green]
      c1 c2 c3 c4 c5 c6 c7 c8
      
      node [fillcolor = orange]
      
      edge [color = grey]
      S1 -> {c1 c2}
      S2 -> {c3 c4 c5}
      c1 -> {p1 p2 p3 p4}
      c2 -> {p1 p2 p3 p4}
      c3 -> {p1 p2 p3 p4}
      c4 -> {p1 p2 p3 p4}
      c5 -> {p1 p2 p3 p4}

      graph [rankdir = LR]

      edge [color = grey]
      S3 -> {c6 c7 c8}
      c6 -> {p1 p2 p3 p4}
      c7 -> {p1 p2 p3 p4}
      c8 -> {p1 p2 p3 p4}

      }")


grViz("
digraph neato {
      
      graph [layout = neato]
      
      node [shape = circle,
      style = filled,
      color = grey,
      label = '']
      
      node [fillcolor = red]
      a
      
      node [fillcolor = green]
      b c d
      
      node [fillcolor = orange]
      
      edge [color = grey]
      a -> {b c d}
      b -> {e f g h i j}
      c -> {k l m n o p}
      d -> {q r s t u v}
      }")


grViz("
      digraph neato {
      
      graph [layout = neato]
      
      node [shape = circle,
      style = filled,
      color = grey]
      
      node [fillcolor = red]
      US
      
      node [fillcolor = green]
      S1 S2 S3
      
      node [fillcolor = orange]
      c1 c2 c3 c4 c5 c6 c7 c8 c9

      node [fillcolor = grey41, label = '']
      p1 p6 p11 p16 p21 p26 p31 p36 p41

      node [fillcolor = grey51, label = '']
      p2 p7 p12 p17 p22 p27 p32 p37 p42

      node [fillcolor = grey61, label = '']
      p3 p8 p13 p18 p23 p28 p33 p38 p43

      node [fillcolor = grey71, label = '']
      p4 p9 p14 p19 p24 p29 p34 p39 p44

      node [fillcolor = grey81, label = '']
      p5 p10 p15 p20 p25 p30 p35 p40 p45

      edge [color = grey]
      US -> {S1 S2 S3}
      S1 -> {c1 c2 c3}
      S2 -> {c4 c5 c6}
      S3 -> {c7 c8 c9}
      c1 -> {p1 p2 p3 p4 p5}
      c2 -> {p6 p7 p8 p9 p10}
      c3 -> {p11 p12 p13 p14 p15}
      c4 -> {p16 p17 p18 p19 p20}
      c5 -> {p21 p22 p23 p24 p25}
      c6 -> {p26 p27 p28 p29 p30}
      c7 -> {p31 p32 p33 p34 p35}
      c8 -> {p36 p37 p38 p39 p40}
      c9 -> {p41 p42 p43 p44 p45}
      }")

