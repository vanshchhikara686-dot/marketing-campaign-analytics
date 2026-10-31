# Marketing Campaign Performance & ROI Analytics

An end-to-end data analytics project focused on evaluating digital marketing campaign performance, measuring return on investment (ROI), and identifying opportunities to improve marketing efficiency.

## Project Overview

Marketing teams invest across multiple advertising channels and campaign types. However, spending more does not necessarily mean generating better returns.

This project analyses marketing campaign data to understand how different channels and campaigns perform across spending, impressions, clicks, conversions, and attributed revenue.

The objective is to transform raw marketing data into meaningful business insights using Excel, SQL, and Power BI.

## Business Objectives

* Evaluate campaign performance across marketing channels.
* Measure Return on Ad Spend (ROAS).
* Identify campaigns generating the highest revenue.
* Analyse advertising costs and conversion performance.
* Compare monthly marketing performance.
* Support data-driven marketing budget allocation.

## Tools & Technologies

| Tool            | Purpose                                               |
| --------------- | ----------------------------------------------------- |
| Microsoft Excel | Data cleaning, preparation, formulas and pivot tables |
| SQL Server      | Data querying, aggregation and performance analysis   |
| Power BI        | Interactive dashboards and data visualisation         |

## Dataset Information

The dataset contains marketing campaign performance records with the following fields:

| Column                 | Description                     |
| ---------------------- | ------------------------------- |
| Month                  | Campaign reporting month        |
| Campaign_ID            | Unique campaign identifier      |
| Channel                | Marketing acquisition channel   |
| Campaign_Type          | Type of marketing campaign      |
| Campaign_Name          | Campaign name                   |
| Spend_INR              | Marketing expenditure           |
| Impressions            | Total ad impressions            |
| Clicks                 | Total clicks                    |
| Conversions            | Total conversions               |
| Attributed_Revenue_INR | Revenue attributed to campaigns |

**Currency:** Indian Rupees (INR)

## Key Performance Indicators (KPIs)

The project evaluates marketing performance using:

* Total Marketing Spend
* Total Attributed Revenue
* Total Impressions
* Total Clicks
* Total Conversions
* Click-Through Rate (CTR)
* Cost Per Click (CPC)
* Cost Per Acquisition (CPA)
* Conversion Rate
* Return on Ad Spend (ROAS)
* Return on Investment (ROI)

### Important Formulas

**CTR**
Clicks / Impressions × 100

**CPC**
Marketing Spend / Clicks

**CPA**
Marketing Spend / Conversions

**Conversion Rate**
Conversions / Clicks × 100

**ROAS**
Attributed Revenue / Marketing Spend

**ROI**
(Attributed Revenue − Marketing Spend) / Marketing Spend × 100

## Project Structure

```text
marketing-campaign-analytics/
│
├── Dataset/
│   ├── Marketing_Campaign_ROI_Analytics_Dataset.xlsx
│   └── README.md
│
├── SQL/
│   ├── marketing analysis.sql
│   └── README.md
│
├── PowerBI/
│   ├── Dashboard screenshots
│   └── README.md
│
└── README.md
```

## Analysis Performed

### 1. Excel Analysis

* Data exploration and cleaning
* Pivot table analysis
* KPI calculations
* Campaign performance comparisons
* Trend analysis

### 2. SQL Analysis

* Aggregation using GROUP BY
* Campaign-level performance analysis
* Channel-level revenue analysis
* Monthly performance analysis
* ROAS and CPA calculations

### 3. Power BI Dashboard

* Executive performance overview
* Monthly revenue analysis
* Channel performance comparison
* Campaign performance analysis
* ROAS comparison

## Key Business Questions

1. Which marketing channel generates the highest revenue?
2. Which channel provides the best ROAS?
3. Which campaigns generate the most revenue?
4. How does marketing performance change over time?
5. Which campaigns have higher acquisition costs?
6. How efficiently is the marketing budget being utilised?

## Dashboard Preview

Explore the Power BI dashboard screenshots in the `PowerBI` folder.

## Project Files

* [Dataset](Dataset/)
* [SQL Queries](SQL/)
* [Power BI Dashboard](PowerBI/)

## Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis
* Microsoft Excel
* SQL
* Power BI
* KPI Development
* Data Visualisation
* Business Intelligence
* Marketing Analytics
* Business Problem Solving

## Project Purpose

This project was developed as part of my data analytics portfolio to demonstrate practical application of data analysis tools in solving business problems.

---

**Author:** Vishu

**Project:** Marketing Campaign Performance & ROI Analytics
