#  Pizza Sales SQL Analysis

## 📌 Project Overview

This project focuses on analyzing pizza sales data using SQL to uncover meaningful business insights.  
The objective of this project was not only to practice SQL queries but also to understand how businesses use data for decision-making related to sales, customer behavior, and revenue growth.

Using multiple related datasets, this project explores:

- Top-selling pizzas
- Revenue generation
- Customer ordering trends
- Category-wise performance
- Sales growth over time

All analysis was performed using SQL queries.

---

##  Dataset Used

The project uses the following datasets:

- `orders.csv`
- `order_details.csv`
- `pizzas.csv`
- `pizza_types.csv`

These datasets contain information about:

- Customer orders
- Pizza categories
- Pizza sizes
- Quantities sold
- Prices
- Order timestamps

---

##  Tools & Technologies Used

- SQL Server / MySQL
- GitHub
- CSV Dataset Files

---

##  Business Problems Solved

### Basic Analysis

- Retrieved the total number of orders placed
- Calculated total revenue generated from pizza sales
- Identified the highest-priced pizza
- Found the most commonly ordered pizza size
- Listed the top 5 most ordered pizzas

### Intermediate Analysis

- Calculated quantity sold by pizza category
- Analyzed order distribution by hour
- Studied category-wise pizza sales
- Calculated average pizzas ordered per day
- Found top pizzas based on revenue

### Advanced Analysis

- Calculated percentage revenue contribution of each pizza
- Analyzed cumulative revenue over time
- Found top-performing pizzas in each category

---

## SQL Concepts Used

- Joins
- Aggregate Functions
- `GROUP BY`
- Window Functions
- CTEs
- Revenue Analysis
- Sorting & Filtering

---

## Sample SQL Query

```sql
-- Calculate cumulative revenue over time

SELECT 
    order_date,
    SUM(revenue) OVER(ORDER BY order_date) AS cumulative_revenue
FROM sales;
```

---

## 📌 Key Insights

- Peak ordering hours were identified
- Top-selling pizza categories were analyzed
- Customer ordering patterns were studied
- Revenue contribution of different pizzas was evaluated
- Sales growth trends were observed using cumulative revenue

---

## Learning Outcomes

Through this project, I gained practical experience in SQL-based data analysis and learned how real-world datasets can be used to derive business insights.

I also improved my understanding of:

- Relational databases
- Window functions
- Query optimization
- Business-oriented data analysis

---

## Future Improvements

- Create a Power BI dashboard
- Add interactive data visualizations
- Perform analysis using Python
- Build a complete business analytics dashboard

---

## Author

**Aryan Prajapati**  
Electrical Engineering Student  
MANIT Bhopal
