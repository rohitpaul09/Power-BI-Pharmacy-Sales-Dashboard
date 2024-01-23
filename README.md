# Power-BI-Pharmacy-Sales-Dashboard

## Project Overview

Pharmacy-Sales-Dashboard is a comprehensive Power BI dashboard designed for analyzing pharmacy sales data. The project includes integration with a MySQL database, allowing for real-time data analysis and visualization. This dashboard provides valuable insights into sales trends, product performance, and customer behaviors within pharmacy operations.

## Features

- **Data Preprocessing**: SQL scripts for creating and cleaning data in a MySQL database.
- **Database Connection**: Direct integration with MySQL for real-time data access.
- **Optimized Data Fetch**: Efficient data fetching from the database using optimized SQL queries.
- **Dynamic Data Querying**: Parameterized queries in Power Query Editor for flexible data fetching based on the 'Product Type' parameter.
- **DAX Measures**: Custom DAX measures for in-depth data analysis, such as Return Rate, Total Sales, and Total Transactions.
- **Interactive Dashboard**: An intuitive and interactive Power BI dashboard offering a range of visualizations.

<img src="https://drive.google.com/uc?id=1RUxsHkBloDD8G1jdk_4eCa91IwLYsQ27" alt="pharmacy dashboard" width="700" height="400">

## Installation

1. **Import Database**: Use `pharmacy-data.sql` to import the database with all data.
2. **Database Setup**: Run the SQL script for data preprocessing.
3. **Power BI Connection**: Connect the Power BI to the MySQL database.
4. **Dashboard Configuration**: Load the `pharmacy_sales_dashboard.pbix` file in Power BI and configure the data source.
5. **Data Refresh**: Refresh Power BI to ensure it pulls the latest data from the database.

## Usage

- **Parameterized Queries**: Adjust the 'Product Type' parameter in Power Query to filter the dataset.
- **Explore Dashboard**: Utilize the interactive elements in the dashboard for detailed sales analysis.
- **Dynamic Dashboard Header**: The dashboard header updates dynamically to display the selected 'Product Type'.

## DAX Measures

- **Return Rate**: `DIVIDE(SUM(sales_data[ReturnQuantity]), SUM(sales_data[Quantity]))`
- **Total Sales**: `SUM(sales_data[Final_Sales])`
- **Total Transactions**: `COUNTROWS(sales_data)`
- **Selected Type**: `SELECTEDVALUE(sales_data[SubCat1])`

## Contact

For any queries, suggestions, or contributions, please email [rohitpaul09@gmail.com](mailto:rohitpaul09@gmail.com).
