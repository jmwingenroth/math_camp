library(tidyverse)

n <- 1000
k <- c(5, 10, 20, 50, 100)

chi_squared <- function(k) sum(rnorm(k)^2)

chi_squared_density <- function(x, k) {
    x^(k / 2 - 1) * exp(-x / 2) / (2^(k / 2) * gamma(k / 2))
}

data <- map_dfr(k, function(kk) tibble(k = kk, z = map_dbl(1:n, ~ chi_squared(kk))))

curves <- map_dfr(k, ~ tibble(k = .x, x = seq(0, .x * 3, length.out = 200), y = dchisq(x, df = .x)))

stats <- data %>%
    group_by(k) %>%
    summarize(emp_mean = mean(z), emp_var = var(z)) %>%
    mutate(
        label = sprintf(
            "empirical: mean = %.2f, var = %.2f\ntheoretical: mean = %d, var = %d",
            emp_mean, emp_var, k, 2 * k
        )
    )

plot <- function(data, curves, stats) {
    data %>%
        ggplot(aes(x = z, fill = factor(k))) +
        geom_histogram(aes(y = after_stat(density)), bins = 60) +
        geom_line(data = curves, aes(x = x, y = y), color = "black", inherit.aes = FALSE) +
        geom_text(
            data = stats, aes(x = Inf, y = Inf, label = label),
            hjust = 1.05, vjust = 1.5, size = 3, inherit.aes = FALSE
        ) +
        facet_grid(rows = vars(k)) +
        labs(fill = "k")
}

p1 <- plot(data, curves, stats)
ggsave("./r_session_2/plot1.png", p1)

curve(chi_squared_density(x, k = 5), from = 0, to = 25)
