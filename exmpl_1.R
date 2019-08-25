require(tidyverse)
require(ggvis)
mtcars %>% ggvis(~wt, ~mpg)%>% layer_points() %>%
  add_axis("x", title = "Weight") %>%
  add_axis("y", title = "Miles per gallon")

mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  add_axis("x") %>%
  add_axis("x", offset = 40, grid = FALSE)

mtcars2 <- mtcars %>% dplyr::mutate(cyl = ordered(mtcars$cyl))
mtcars2 %>% ggvis(~mpg, ~wt, size = ~cyl, fill = ~cyl) %>% layer_points()

mtcars %>% 
  ggvis(~wt, ~mpg, 
        size := input_slider(10, 100),
        opacity := input_slider(0, 1)
  ) %>% 
  layer_points()


  
mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_smooths(span = 1) %>%
  layer_smooths(span = 0.3, stroke := "red")

mtcars %>% 
  ggvis(~wt) %>% 
  layer_histograms(width =  input_slider(0, 2, step = 0.10, label = "width"),
                   center = input_slider(0, 2, step = 0.05, label = "center"))