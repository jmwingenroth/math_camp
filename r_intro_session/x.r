
library(tidyverse)
library(matlib)

n = 6

scores <- floor(runif(n, 80, 100))
names <- letters[1:n]

a_grade <- scores > 90

curved = (scores + 100)/2

