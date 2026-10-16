# ============================================================
# Diamond Price Analysis Using R
# Dataset: ggplot2::diamonds
# ============================================================

# 1. Install and load the required package
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

# 2. Create output directories if they do not exist
dir.create("results/figures", recursive = TRUE, showWarnings = FALSE)
dir.create("results/tables", recursive = TRUE, showWarnings = FALSE)

# 3. Load the dataset
data("diamonds", package = "ggplot2")
diamonds_data <- ggplot2::diamonds

# 4. Inspect the data
cat("===== DATA OVERVIEW =====\n")
cat("Rows:", nrow(diamonds_data), "\n")
cat("Columns:", ncol(diamonds_data), "\n\n")
print(str(diamonds_data))
print(summary(diamonds_data))

# Save a compact overview of numeric variables
numeric_summary <- data.frame(
  variable = c("carat", "depth", "table", "price", "x", "y", "z"),
  mean = sapply(diamonds_data[c("carat", "depth", "table", "price", "x", "y", "z")], mean),
  median = sapply(diamonds_data[c("carat", "depth", "table", "price", "x", "y", "z")], median),
  standard_deviation = sapply(diamonds_data[c("carat", "depth", "table", "price", "x", "y", "z")], sd)
)
write.csv(numeric_summary,
          "results/tables/numeric_summary.csv",
          row.names = FALSE)

# 5. Summarize prices by cut category
summary_by_cut <- aggregate(
  cbind(price, carat) ~ cut,
  data = diamonds_data,
  FUN = function(x) mean(x)
)
names(summary_by_cut) <- c("cut", "average_price", "average_carat")

count_by_cut <- as.data.frame(table(diamonds_data$cut))
names(count_by_cut) <- c("cut", "number_of_diamonds")

median_price_by_cut <- aggregate(
  price ~ cut,
  data = diamonds_data,
  FUN = median
)
names(median_price_by_cut) <- c("cut", "median_price")

summary_by_cut <- merge(summary_by_cut, count_by_cut, by = "cut")
summary_by_cut <- merge(summary_by_cut, median_price_by_cut, by = "cut")
summary_by_cut <- summary_by_cut[
  order(summary_by_cut$average_price, decreasing = TRUE), ]

write.csv(summary_by_cut,
          "results/tables/summary_by_cut.csv",
          row.names = FALSE)

# 6. Visualization 1: distribution of diamond prices
p1 <- ggplot(diamonds_data, aes(x = price)) +
  geom_histogram(bins = 40, fill = "#2C7FB8", color = "white") +
  labs(
    title = "Distribution of Diamond Prices",
    subtitle = "Prices in the diamonds dataset",
    x = "Price (USD)",
    y = "Number of diamonds"
  ) +
  theme_minimal(base_size = 12)

ggsave("results/figures/01_price_distribution.png",
       plot = p1, width = 8, height = 5, dpi = 300)

# 7. Visualization 2: carat weight versus price
p2 <- ggplot(diamonds_data, aes(x = carat, y = price)) +
  geom_point(alpha = 0.22, color = "#2C7FB8") +
  geom_smooth(method = "lm", formula = y ~ x, se = TRUE,
              color = "#D95F0E", linewidth = 1) +
  labs(
    title = "Carat Weight vs. Diamond Price",
    subtitle = "The line shows a simple linear trend",
    x = "Carat",
    y = "Price (USD)"
  ) +
  theme_minimal(base_size = 12)

ggsave("results/figures/02_carat_vs_price.png",
       plot = p2, width = 8, height = 5, dpi = 300)

# 8. Visualization 3: price distribution by cut
p3 <- ggplot(diamonds_data, aes(x = cut, y = price)) +
  geom_boxplot(fill = "#7FCDBB", outlier.alpha = 0.18) +
  labs(
    title = "Diamond Price by Cut Quality",
    x = "Cut quality",
    y = "Price (USD)"
  ) +
  theme_minimal(base_size = 12)

ggsave("results/figures/03_price_by_cut.png",
       plot = p3, width = 8, height = 5, dpi = 300)

# 9. Visualization 4: average price by cut
p4 <- ggplot(summary_by_cut,
             aes(x = reorder(cut, average_price), y = average_price)) +
  geom_col(fill = "#41AB5D") +
  coord_flip() +
  labs(
    title = "Average Diamond Price by Cut Quality",
    x = "Cut quality",
    y = "Average price (USD)"
  ) +
  theme_minimal(base_size = 12)

ggsave("results/figures/04_average_price_by_cut.png",
       plot = p4, width = 8, height = 5, dpi = 300)

# 10. Correlation analysis: carat and price
correlation_test <- cor.test(
  diamonds_data$carat,
  diamonds_data$price,
  method = "pearson"
)
capture.output(
  {
    cat("Pearson correlation between carat and price\n\n")
    print(correlation_test)
  },
  file = "results/tables/correlation_result.txt"
)

# 11. Simple linear regression: price predicted by carat
model <- lm(price ~ carat, data = diamonds_data)
capture.output(
  {
    cat("Simple linear regression: price ~ carat\n\n")
    print(summary(model))
  },
  file = "results/tables/linear_regression_summary.txt"
)

# Save fitted model coefficients
coefficients_table <- data.frame(
  term = names(coef(model)),
  estimate = as.numeric(coef(model))
)
write.csv(coefficients_table,
          "results/tables/linear_regression_coefficients.csv",
          row.names = FALSE)

# 12. Print a short report to the console
cat("\n===== KEY STATISTICAL RESULTS =====\n")
cat("Pearson correlation (carat vs price):",
    round(unname(cor(diamonds_data$carat, diamonds_data$price)), 4), "\n")
cat("Regression intercept:",
    round(unname(coef(model)[1]), 2), "\n")
cat("Regression slope for carat:",
    round(unname(coef(model)[2]), 2), "\n")
cat("Model R-squared:",
    round(summary(model)$r.squared, 4), "\n\n")

cat("Analysis completed.\n")
cat("Charts saved in: results/figures/\n")
cat("Tables and statistical reports saved in: results/tables/\n")

#print(p1)
print(p2)
#print(p3)
#print(p4)
