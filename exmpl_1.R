require(tidyverse)
require(ggvis)
ggvis(mtcars, props(~wt, ~mpg)) 