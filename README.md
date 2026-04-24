# 🛒 Shopkart — Your Digital Marketplace

## 📌 Overview

**SHOPKART** is a simulated e-commerce platform designed to model the structure and operations of a modern online retail ecosystem. It provides a seamless digital shopping experience by integrating key business functions such as product browsing, order processing, and payment handling.

The project captures the **end-to-end workflow of an e-commerce system**, enabling users to understand how data flows across different components—from product discovery to transaction completion.

---

## 🧩 Core Functional Areas

**SHOPKART** is structured around key business modules:

* **Product Management** — Product listings, categorization, and inventory tracking
* **Customer Management** — Customer data and interactions
* **Order Processing** — Order creation, tracking, and item-level details
* **Payment Handling** — Transaction processing and payment records

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

* Understanding relational database design
* Exploring e-commerce business logic
* Performing sales and customer behavior analysis
* Practicing SQL queries on structured datasets
* Studying transaction and order patterns

---

## 🗂️ Project Structure

```bash
SHOPKART/
│
├── Assets/     # Images, diagrams, and media files
│
├── Reports/    # Dashboard & Reports
│   ├── Shopkart Report.pbip     
│
├── TXT/        # Dataset files (raw data)
│   ├── Category.txt
│   ├── Customers.txt
│   ├── Order_Items.txt
│   ├── Orders.txt
│   ├── Payments.txt
│   └── Products.txt
│
├── SQL/        # Database schema and query files
│   ├── Shopkart - Database & Table Schema.sql
│   └── Shopkart Analytical Questions.sql
│
└── README.md
```

---

## 🛠️ Tech Stack

* **SQL** (Relational Database Design & Queries)
* **Microsoft Excel** (Data Cleaning & Dashboard Development)
* **Power BI** (Data Visualization)
* **Markdown** (Documentation)

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

## 📈 Key Insights You Can Explore

* Customer purchasing behavior
* Product performance across categories
* Revenue and transaction trends
* Order frequency and lifecycle patterns
* Payment distribution and preferences
* Top Cities generating Revenue

---

## 📌 Key Metrics

* Total Revenue
* Total Orders
* Total Customers
* Average Order Value (AOV)
* Customer Retention Rate
* Revenue Contribution per Customer.

---

## 📊 Dashboard Preview

The dashboard provides a comprehensive overview of business performance, including:

* Revenue trends over time
* Order distribution by status
* Category-wise revenue performance
* Top-performing products
* Customer demographics (gender and age distribution)
* Geographic insights based on customer location
* Payment behavior across different modes
* Top performing cities

Interactive slicers—such as years, months, gender, payment mode, order status, and state—allow users to dynamically filter and explore the data.

![Shopkart Dashboard](<Assets/Shopkart Report.png>)

---

## 🔍 Sample Insights

* Electronics category contributes a significant portion of total revenue.
* Majority of transactions are completed via digital payment method - ***UPI.***
* Order cancellations are concentrated within specific regions.
* Repeat customers contribute notably to overall revenue.

---

## 🎯 Objective

The goal of this project is to bridge the gap between **theoretical database concepts** and **real-world business applications**, specifically within an e-commerce context.

---

## 🚀 Future Enhancements

* **Expand and Enrich Dataset**
  Introduce additional entities such as suppliers, reviews, and shipping details to increase analytical depth.

* **Implement Advanced SQL Analytics**
  Use window functions, CTEs, and performance optimization techniques for deeper insights.

* **Develop Interactive Dashboards**
  Enhance visualization using advanced Excel and Power BI features.

---

## 📜 License

This project is intended for **educational and analytical purposes only**.

---

## ✍️ Final Note

Shopkart is more than just a dataset—it is a structured representation of how digital commerce systems operate, providing a strong foundation for learning **data analysis, database design, and business intelligence**.