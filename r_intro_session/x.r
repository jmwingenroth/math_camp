
library(tidyverse)
library(matlib)

n = 6

scores <- floor(runif(n, 80, 100))
names <- letters[1:n]

a_grade <- scores > 90

curved = (scores + 100)/2

# matrix
m_row <- matrix(1:4, nrow = 2, byrow = TRUE)

m_row 

t(m_row)

data(mpg)

glimpse(mpg)

ggplot(mpg, aes(x = hwy)) +
    geom_histogram()

grade <- function(x) {
    LETTERS[min(4,11 - ceiling(x/10))]
}

 m_row
