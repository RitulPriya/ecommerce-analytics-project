#  E-Commerce Analytics — End-to-End Data Project

##  Project Overview

This project demonstrates an end-to-end analytics workflow built on a large-scale e-commerce transactional dataset.
It covers data ingestion, validation, cleaning, transformation, KPI engineering, and interactive dashboard development.

The objective was to convert raw, unstructured transaction records into an analysis-ready data model to support business decision-making across revenue, customers, products, and returns.

---

##  Dataset Description

* **Source:** Online Retail Transaction Dataset
* **Total Records:** 541,910
* **Granularity:** Invoice line-item level
* **Format:** CSV

## Data Source & Attribution

The dataset used in this project was obtained from Kaggle:

**Dataset:** Online Retail Dataset
**Source Platform:** Kaggle

It contains transactional records of an online retail store, including sales, returns, customer details, and product information.

This dataset is publicly available for analytics and educational use.
All transformations, cleaning, and KPI engineering performed in this project were independently developed as part of the analytics workflow.

---

### Key Fields

| Column       | Description                |
| ------------ | -------------------------- |
| invoice_id   | Unique invoice identifier  |
| stock_cd     | Product / service code     |
| descr        | Product description        |
| quant        | Quantity sold / returned   |
| unit_pr      | Unit price                 |
| customer_id  | Customer identifier        |
| country      | Transaction geography      |
| invoice_dt   | Raw transaction timestamp  |
| revenue      | quant × unit_pr            |
| invoice_flag | SALE / RETURN / ADJUSTMENT |
| product_flag | Product vs Non-Product     |

---

##  Data Cleaning & Transformation

Data preparation was performed entirely in **MySQL** using industry-standard validation techniques.

### Key Cleaning Steps

* Validated full data load & row counts
* Removed NULL / blank invoice IDs
* Classified invoices into SALE / RETURN / ADJUSTMENT
* Standardized quantity & pricing logic
* Engineered revenue column
* Identified & removed duplicate transactions
* Standardized product descriptions
* Classified product vs non-product transactions
* Handled missing customer IDs
* Parsed multiple date formats
* Created canonical invoice dates
* Built time-series ready dataset

---

## 📊 KPI Framework

### Revenue Metrics

* Total Revenue
* Net Revenue
* Return Revenue Impact

### Order Metrics

* Total Orders
* Average Order Value (AOV)

### Customer Metrics

* Total Customers
* Repeat Customers
* New vs Repeat Segmentation
* Order Frequency Distribution

### Product Metrics

* Top Products by Revenue
* Top Products by Quantity
* Product Contribution %
* Sales Velocity

### Return Metrics

* Return Rate
* Return Rate by Product
* Return Rate by Country
* Monthly Return Trends
* Return Spike Detection

### Geographic Metrics

* Revenue by Country
* Orders by Country
* AOV by Country
* Customer Distribution

---

## Dashboard Preview

The Power BI dashboard is divided into four analytical views:

1. **Executive Overview**

   * Revenue, Orders, Customers, Return Rate
   * Monthly revenue trends

2. **Sales Analysis**

   * Product performance
   * Quantity trends
   * Country revenue leaders

3. **Customer & Geography**

   * Repeat customers
   * Customer distribution
   * AOV by country

4. **Returns & Quality Analysis**

   * Return revenue
   * Return rate by product
   * Monthly return spikes

(Screenshots available in `/dashboards` folder.)

---

## 🛠️ Tools & Technologies

* **MySQL** → Data cleaning & transformation
* **Excel** → Initial inspection
* **Power BI** → Dashboard development
* **CSV** → Data storage
* **GitHub** → Version control & portfolio hosting

---

##  Business Impact

This project enables stakeholders to:

* Track revenue performance
* Monitor customer retention
* Identify top-selling products
* Detect return anomalies
* Analyze geographic markets
* Support pricing & sales strategy

---

##  Project Structure

```
data/ → Raw & processed datasets  
sql/ → Data cleaning & KPI scripts  
dashboards/ → Power BI screenshots  
README.md → Project documentation
```

---

##  Author

**Ritul Priya**
Data Analyst | SQL | Power BI | Analytics Engineering

---
