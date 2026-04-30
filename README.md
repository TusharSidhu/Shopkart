# 🛒 Shopkart — Your Digital Marketplace

![SQL](https://img.shields.io/badge/SQL-Database-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![Excel](https://img.shields.io/badge/Excel-Analysis-green)
![License](https://img.shields.io/badge/License-Educational-lightgrey)
![Repo Size](https://img.shields.io/github/repo-size/TusharSidhu/Shopkart)
![Last Commit](https://img.shields.io/github/last-commit/TusharSidhu/Shopkart)

---

## 📚 Table of Contents
- Overview
- Core Functional Areas
- System Workflow
- Purpose & Use Cases
- Project Structure
- Tech Stack
- Database Design
- Dashboards
- Key Insights
- Key Metrics
- Sample Insights
- Objective
- Future Enhancements
- License

---

## 📌 Overview

**SHOPKART** is a simulated e-commerce platform designed to model the structure and operations of a modern online retail ecosystem. It provides a seamless digital shopping experience by integrating key business functions such as product browsing, order processing, and payment handling.

The project captures the **end-to-end workflow of an e-commerce system**, enabling users to understand how data flows across different components—from product discovery to transaction completion.

---

## 🧩 Core Functional Areas

**SHOPKART** is structured around key business modules:

- **Product Management** — Product listings, categorization, and inventory tracking  
- **Customer Management** — Customer data and interactions  
- **Order Processing** — Order creation, tracking, and item-level details  
- **Payment Handling** — Transaction processing and payment records  

These components are interconnected to reflect real-world dependencies in an online marketplace.

---

## 🔄 System Workflow

The platform simulates a typical customer journey:

1. Customers browse products across categories  
2. Products are added to orders  
3. Orders are processed and recorded  
4. Payments are completed and tracked  

This mirrors real-world e-commerce operations at scale.

---

## 📊 Purpose & Use Cases

**SHOPKART** serves as a **learning and analytical tool**, useful for:

- Understanding relational database design  
- Exploring e-commerce business logic  
- Performing sales and customer behavior analysis  
- Practicing SQL queries on structured datasets  
- Studying transaction and order patterns  

---

## 🗂️ Project Structure

```bash
SHOPKART/
│
├── Assets/     # Images, diagrams, and media files
│
├── Data/       # Dataset files (raw data)
│   ├── Category.txt
│   ├── Customers.txt
│   ├── Order_Items.txt
│   ├── Orders.txt
│   ├── Payments.txt
│   └── Products.txt
│
├── Reports/    # Dashboard & Reports
│   ├── Report Shopkart.pbix    # Power Bi Shopkart Report (Interactive)
│   ├── Report Shopkart.pdf     # Power Bi Shopkart Report (Static Images)
│
├── SQL/        # Database schema and query files
│   ├── Shopkart - Database & Table Schema.sql
│   └── Shopkart Analytical Questions.sql
│
└── README.md
```

---

## 🛠️ Tech Stack

| Tool            | Purpose                            |
| --------------- | ---------------------------------- |
| SQL             | Data modeling, querying, analytics |
| Microsoft Excel | Data cleaning & dashboarding       |
| Power BI        | Interactive data visualization     |
| Markdown        | Documentation                      |

---

## 🧠 Database Design

The database follows a **relational model**, connecting entities such as:

* Customers
* Orders
* Products
* Categories
* Payments
* Order Items

These entities are linked through defined relationships to ensure data integrity and efficient querying.

### 📌 ER Diagram

The Entity Relationship (ER) Diagram illustrates how these entities interact:

![Shopkart ER Diagram](<Assets/Shopkart ER Diagram.png>)

---

## 📊 Dashboards

The project includes both Excel and Power BI dashboards to analyze business performance from different perspectives.

---

### 🟢 Excel Dashboard

#### 📍 Shopkart Overview

This dashboard provides a consolidated view of SHOPKART’s overall business performance across key dimensions including revenue, orders, customers, and purchasing behavior.

It highlights **₹432M+ in total revenue**, generated from over **12K orders** and **3K customers**, with an average order value of approximately **₹38K** and a strong **79% repeat customer rate**, indicating high customer retention.

Key observations from the dashboard:

- **Revenue Trends:** Revenue remains relatively stable across months with noticeable peaks in mid-year and festive periods, suggesting seasonal demand patterns.
- **Order Status Distribution:** The majority of orders are successfully delivered, with minimal cancellations and returns, reflecting operational efficiency.
- **Category Performance:** Electronics and Sports & Fitness emerge as top revenue-generating categories, significantly outperforming others.
- **Top Products:** A small group of high-performing products contributes disproportionately to total revenue, indicating a classic Pareto distribution.
- **Customer Demographics:** Gender distribution is nearly balanced, while the **26–35 age group** represents the largest customer segment.
- **Payment Behavior:** Digital payments dominate, with **UPI accounting for the largest share**, followed by cards and net banking.
- **Geographic Insights:** Certain states and cities contribute significantly more to revenue, highlighting key regional markets.

Overall, the dashboard enables quick identification of **sales drivers, customer behavior patterns, and regional performance**, supporting data-driven decision-making.

>![Shopkart Dashboard Excel](<Assets/Shopkart Report.png>)

---

### 🔵 Power BI - Executive

#### 📍 Executive Overview Dashboard

This dashboard provides a high-level summary of SHOPKART’s overall performance, focusing on key business metrics, order distribution, and payment behavior.

It reports **₹459M+ in total revenue**, generated from approximately **12K orders** and **3K customers**, with an average order value of around **₹39.5K** and a strong **80.95% repeat customer rate**, indicating consistent customer retention.

Key insights from this view:

- **Revenue Trends:** Revenue shows moderate fluctuations across months and years, with certain peaks indicating seasonal or promotional demand cycles.
- **Order Status Distribution:** A significant majority of orders are successfully delivered (~66%), while cancellations (~6.5%) and returns remain relatively low, suggesting stable operational performance.
- **Payment Behavior:** **UPI dominates with ~50% share**, followed by cards and net banking, confirming strong adoption of digital payment methods.
- **Cancellations Analysis:** Cancellation rate stands at **6.5%**, with specific cities contributing more heavily, highlighting potential logistical or operational inefficiencies.
- **City-Level Performance:** Certain cities consistently show higher cancellation percentages, which may require targeted operational improvements.

Overall, this dashboard serves as an **executive snapshot**, enabling quick monitoring of KPIs, operational health, and transaction behavior.

>![Executive Overview - Power BI](<Assets/Shopkart Report - PB.png>)

### 🔵 Power BI - Product & Sales

#### 📍 Product & Revenue Analysis

This dashboard focuses on product-level performance, category contribution, and the impact of pricing factors such as taxation on overall revenue.

Key insights from this view:

- **Stock vs Sales Relationship (Scatter Analysis):**  
  The scatter chart visualizes the relationship between inventory levels and sales across product categories, using total revenue as the data point indicator. It helps identify categories with **high revenue but low stock (potential stock-out risks)** and those with **high stock but lower sales (inventory inefficiencies)**.

- **GST Impact on Revenue:**  
  The column chart highlights how different GST rates influence revenue generation across products. It enables comparison of **tax brackets vs revenue contribution**, helping evaluate pricing strategies and their effect on sales performance.

- **Top 10 Products Performance:**  
  A tabular view presents the top-performing products based on revenue, enhanced with **data bars for quick visual comparison**. Additional metrics such as **quantity sold and product ratings** provide a multi-dimensional perspective on product success, balancing both sales volume and customer satisfaction.

- **Revenue by Category:**  
  The bar chart shows category-wise revenue distribution, clearly identifying **high-performing categories** and those with lower contribution, supporting strategic decisions around product focus and inventory planning.

Overall, this dashboard provides a **granular view of product performance and revenue drivers**, enabling better decision-making in inventory management, pricing, and category optimization.

>![Product & Sales Analysis - Power BI](<Assets/Shopkart Report - PB2.png>)

### 🔵 Power BI - Customer & Geographics

#### 📍 Customer & Geographic Insights

This dashboard focuses on customer demographics, geographic performance, and order distribution across regions, providing deeper insight into customer behavior and market reach.

Key insights from this view:

- **Customer Growth Trends:** Customer acquisition shows fluctuations across months and years, with periods of strong growth followed by stabilization, indicating evolving demand patterns.
- **Age Distribution:** The **20–39 age group** forms the largest customer segment, highlighting a predominantly young and active customer base.
- **Gender Distribution:** The customer base is nearly balanced, with a slight male majority (~52%), indicating broad market appeal across genders.
- **Geographic Revenue Distribution:** Major metropolitan areas such as Delhi, Mumbai, Bengaluru, and Hyderabad contribute significantly to revenue, identifying key business hubs.
- **Orders by State:** States like **Maharashtra, Punjab, and Karnataka** lead in order volume, showcasing strong regional demand concentration.
- **Regional Spread:** The geographic distribution reflects a wide market presence, with varying performance across states and cities.

This dashboard enables analysis of **who the customers are and where revenue is generated**, supporting targeted marketing, regional strategy, and customer segmentation.

>![Customer Analysis - Power BI](<Assets/Shopkart Report - PB1.png>)

## 🔵 Power BI Dashboard (Interactive)

The Power BI dashboard offers a **fully interactive analytical experience**, enabling dynamic filtering and deeper insights.

### 🎥 Dashboard Interaction Preview

>![Shopkart Interactive Recording](<Assets/Shopkart Recording.gif>)

---

## 📈 Key Insights You Can Explore

* Customer purchasing behavior
* Product performance across categories
* Revenue and transaction trends
* Order frequency and lifecycle patterns
* Payment distribution and preferences
* Top revenue-generating cities

---

## 📌 Key Metrics

* Total Revenue
* Total Orders
* Total Customers
* Average Order Value (AOV)
* Customer Retention Rate
* Revenue contribution per customer

---

## 🔍 Sample Insights

* The Electronics category contributes a significant portion of total revenue
* The majority of transactions are completed via digital payment methods, primarily UPI
* Order cancellations are concentrated within specific regions
* Repeat customers contribute notably to overall revenue

---

## 🎯 Objective

The goal of this project is to bridge the gap between **theoretical database concepts** and **real-world business applications**, specifically within an e-commerce context.

---

## 🚀 Future Enhancements

* **Expand and Enrich Dataset**

  Introduce additional entities such as suppliers, reviews, and shipping details to increase analytical depth

---

## 📜 License

This project is intended for **educational and analytical purposes only**.

---

## ✍️ Final Note

Shopkart is more than just a dataset—it is a structured representation of how digital commerce systems operate, providing a strong foundation for learning **data analysis, database design, and business intelligence**.