# Diamond Price Analysis Using R
DATA | STATISTICAL ANALYSIS | R · RSTUDIO

An exploratory data analysis project using R to investigate the relationship between diamond carat weight, cut quality, and price through data visualization and statistical analysis.

## 01. Project Overview

**Project Name:** Diamond Price Analysis Using R

**Description:**  
This project analyzes diamond prices using the `diamonds` dataset provided by the `ggplot2` package in R. The analysis focuses on price distribution, the relationship between carat weight and price, price differences across cut categories, and a simple linear regression model.

**Objective:**
- Analyze the relationship between diamond carat weight and price.
- Compare diamond prices across different cut-quality categories.
- Visualize price distributions and relationships between variables.
- Evaluate the correlation between carat weight and price.
- Build a simple linear regression model to understand how carat weight relates to price.

**Problem Statement:**  
Diamond prices vary considerably, and understanding the relationship between physical characteristics, cut quality, and price can help reveal patterns in diamond pricing.

**Proposed Solution:**  
Use exploratory data analysis (EDA), descriptive statistics, data visualization, Pearson correlation, and simple linear regression to investigate diamond price patterns.

**Dataset Overview:**

The project uses the built-in `diamonds` dataset from the `ggplot2` package.

| Attribute | Description |
|---|---|
| Total Observations | 53,940 |
| Total Variables | 10 |
| Data Source | `ggplot2::diamonds` |
| Target Variable | `price` |
| Main Predictor | `carat` |

The dataset contains the following variables:

- `carat`: Diamond weight in carats.
- `cut`: Quality of the diamond cut.
- `color`: Diamond color grade.
- `clarity`: Diamond clarity grade.
- `depth`: Total depth percentage.
- `table`: Width of the top facet relative to the widest point.
- `price`: Diamond price in US dollars.
- `x`, `y`, `z`: Diamond dimensions in millimeters.

## 02. Tech Stack

| Category | Technology |
|---|---|
| Programming Language | R |
| IDE | RStudio |
| Dataset | `ggplot2::diamonds` |
| Data Visualization | `ggplot2` |
| Statistical Analysis | Base R |
| Correlation Analysis | Pearson correlation (`cor.test()`) |
| Regression Model | Simple Linear Regression (`lm()`) |
| Output Formats | PNG, CSV, TXT |

## 03. Screenshots / Results

### 3.1. Data Overview

The dataset contains 53,940 observations and 10 variables. The `price` variable ranges from $326 to $18,823, while `carat` ranges from 0.20 to 5.01 carats.

| Statistic | Carat | Price (USD) |
|---|---:|---:|
| Minimum | 0.20 | 326 |
| Median | 0.70 | 2,401 |
| Mean | 0.7979 | 3,933 |
| Maximum | 5.01 | 18,823 |

These descriptive statistics show that the dataset includes diamonds with varying weights and a wide range of prices.

### 3.2. Diamond Price Distribution

<img width="2400" height="1500" alt="01_price_distribution" src="https://github.com/user-attachments/assets/327a5c0c-8c21-4a91-b1f7-a8b2c8ab8b79" />


The histogram visualizes the distribution of diamond prices and helps identify the concentration and spread of prices across the dataset.

### 3.3. Carat Weight vs. Price

<img width="2400" height="1500" alt="02_carat_vs_price" src="https://github.com/user-attachments/assets/550eb7b0-b3c1-438e-9b9e-74f1047f2950" />


The scatter plot and fitted regression line examine the relationship between diamond carat weight and price.

The Pearson correlation coefficient is **0.9216**, indicating a strong positive linear association between carat weight and price in this dataset.

### 3.4. Price Distribution by Cut Quality

<img width="2400" height="1500" alt="04_average_price_by_cut" src="https://github.com/user-attachments/assets/4395a78c-57f0-4466-9d85-c7826ffbb68a" />


The box plot compares diamond prices across the five cut categories: Fair, Good, Very Good, Premium, and Ideal.

This visualization helps compare the median, spread, and potential outliers in each category. Differences in price distributions should be interpreted carefully because carat weight and other diamond characteristics may also affect prices.

### 3.5. Average Price by Cut Quality

<img width="2400" height="1500" alt="03_price_by_cut" src="https://github.com/user-attachments/assets/9579de9e-089f-4e0e-bc66-0fc85ec77761" />


The bar chart compares average diamond prices across cut categories. It provides a descriptive comparison of average prices, but it does not isolate the effect of cut quality from other characteristics.

### 3.6. Correlation and Regression Results

The project uses Pearson correlation and a simple linear regression model with `carat` as the predictor and `price` as the response variable.

**Pearson correlation:** 0.9216

**Linear regression equation:**

\[
\widehat{\text{price}} = -2256.36 + 7756.43(\text{carat})
\]

**Model R-squared:** 0.8493

The model indicates a strong linear relationship between carat weight and price. Its R-squared value means that approximately **84.93% of the variation in price within this dataset is accounted for by the fitted linear relationship with carat weight**.

The slope estimates an average increase of approximately $7,756.43 in price for each additional carat under this simple model. This is a model-based estimate, not a fixed market price rule.

The negative intercept is a mathematical result of fitting the line and should not be interpreted as a realistic price for a zero-carat diamond.

**Generated statistical outputs:**
- `results/tables/numeric_summary.csv`
- `results/tables/summary_by_cut.csv`
- `results/tables/correlation_result.txt`
- `results/tables/linear_regression_summary.txt`
- `results/tables/linear_regression_coefficients.csv`

## 04. Installation & Usage

### 4.1. Prerequisites

- R
- RStudio Desktop
- Internet connection for the initial installation of `ggplot2`, if it is not already installed

### 4.2. Installation

1. Clone or download this repository.

   ```bash
   git clone [repository-url]
   ```

2. Open the project directory.

   ```bash
   cd data-DiamondPriceAnalysis
   ```

3. Open `diamond_price_analysis_r.Rproj` in RStudio.

4. Install the required package in the RStudio Console if needed.

   ```r
   install.packages("ggplot2")
   ```

### 4.3. Configuration

No external CSV file, API key, or database configuration is required. The project uses the `diamonds` dataset included in `ggplot2`.

### 4.4. Run the Project

Open `scripts/diamond_price_analysis.R` in RStudio and click **Source**.

Alternatively, run the following command from the project root directory:

```r
source("scripts/diamond_price_analysis.R")
```

### 4.5. Usage

1. Run the analysis script.
2. Review the data overview and descriptive statistics in the Console.
3. Open `results/figures/` to view the generated charts.
4. Open `results/tables/` to review the statistical reports and summary tables.
5. Interpret the results and use them to formulate data-driven conclusions.

---
