Statistical Arbitrage Using Pairs Trading
Project Overview
This repository contains the implementation of a Statistical Arbitrage strategy using Pairs Trading. The project focuses on identifying pairs of stocks with historically strong relationships and leveraging their mean-reverting behavior to execute profitable trades. The methodology utilizes Copulas to model joint dependency structures between asset pairs, enhancing the robustness of trading signals compared to traditional correlation-based methods.

Features
Data Extraction and Cleaning: Fetches and processes NIFTY500 stock data using the Yahoo Finance API.
Pairs Identification: Selects stock pairs based on Spearman correlation within the same sector.
Marginal Distribution Fitting: Fits distributions like Normal, T-distribution, and Logistic to stock returns.
Copula-Based Dependency Modeling: Models joint distributions with Copulas (e.g., Gaussian, Clayton, Gumbel, Frank, and Joe).
Trading Strategy Implementation: Generates trading signals based on conditional probabilities from the fitted Copulas.
Methodology
1. Data Preparation
Extracts historical OHLCV data for NIFTY500 stocks using the yfinance library.
Filters data to ensure sufficient history and accuracy.
Converts price data into cumulative log returns for analysis.
2. Pairs Selection
Computes Spearman correlation coefficients to find strongly correlated stock pairs within sectors.
Selected sectors include:
Financial Services
Information Technology
Oil & Gas
FMCG
Automobile
Healthcare
3. Marginal Distribution Fitting
Fits multiple probability distributions (Normal, T-distribution, Logistic) to stock returns.
Chooses the best fit using Akaike Information Criterion (AIC), Bayesian Information Criterion (BIC), and Hannan-Quinn Information Criterion (HQIC).
4. Copula Modeling
Fits selected marginal distributions to Copulas.
Evaluates Copula fit using statistical tests like the Kolmogorov-Smirnov (KS) test.
5. Trading Strategy
Implements a mean-reversion strategy based on Copula-derived conditional probabilities.
Dynamically adjusts trading positions based on defined entry and exit thresholds.
Results
The strategy was tested across six industry sectors, with pairs selected for their strong historical relationships. Results demonstrated:

Higher Sharpe Ratios compared to individual stocks.
Reduced Maximum Drawdown, indicating lower risk.
Consistent profitability across market sectors.
Detailed results and performance metrics can be found in the Results section of the project report.
