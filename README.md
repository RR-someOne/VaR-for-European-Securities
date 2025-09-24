## Value at Risk (VaR) for European Securities

## Overview
This repository contains scripts and notebooks for calculating Value at Risk (VaR) for a portfolio of European securities. The project demonstrates the application of various VaR methodologies, including the historical simulation method, variance-covariance method, and Monte Carlo simulation, using real-world market data. The aim is to provide a comprehensive and practical resource for risk management and quantitative analysis.

## Features
Multiple VaR Methods: Implementations of historical, parametric (variance-covariance), and Monte Carlo VaR.

European Market Focus: Specifically designed to handle data for securities traded on European exchanges.

Data Handling: Scripts for downloading and preprocessing historical price data.

Portfolio Analysis: Tools to calculate VaR for individual assets as well as for a diversified portfolio.

Clear Documentation: Each method is explained in detail within Jupyter notebooks for educational purposes.

Getting Started
Follow these steps to set up the project and run the analysis on your local machine.

## Prerequisites
You will need the following installed:

Python 3.8 or higher

pip (Python package manager)

Installation
Clone the repository:

git clone [https://github.com/RR-someOne/VaR-for-European-Securities.git](https://github.com/RR-someOne/VaR-for-European-Securities.git)
cd VaR-for-European-Securities

Create and activate a virtual environment:

python3 -m venv venv
source venv/bin/activate

Install the required libraries:

pip install -r requirements.txt

SciPy: For statistical functions.

yfinance: For providing free access to market data.

Note: The requirements.txt file should contain all necessary libraries like pandas, numpy, yfinance (for data download), and scipy.

Usage
The primary entry points are the Jupyter notebooks located in the notebooks/ directory. To explore the analysis interactively, run:

jupyter notebook

From there, you can open and run the notebooks to see the VaR calculations in action.

## Repository Structure

<img width="465" height="313" alt="Screenshot 2025-09-24 at 9 27 11 AM" src="https://github.com/user-attachments/assets/d6929275-854c-456b-a005-f420b4d43449" />
