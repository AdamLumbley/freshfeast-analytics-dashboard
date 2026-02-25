# FreshFeast Analytics Dashboard

## FF Executive Dashboard

![FF Executive Dashboard](FF%20Executive%20Dashboard.png)

*Executive dashboard design showing key metrics based on FreshFeast subscription data. Numbers are illustrative; real metrics will be available in the interactive dashboard.*

## Overview
FreshFeast Boxes is a fictional subscription meal kit business. This project simulates the company's database and demonstrates SQL analytics for customers, subscriptions, orders, products, and promotions.

## Schema
- **Customers:** Customer info, loyalty tiers, location
- **Products:** Product catalog, categories, prices
- **Subscriptions:** Links customers to products over time
- **Orders:** Actual transactions
- **Promotions:** Discount codes applied to orders

## Seed Data
The database includes realistic seed data for customers, products, subscriptions, orders, and promotions, allowing meaningful analysis.

## Key Insights / Queries
Sample queries demonstrate:
- Monthly revenue by loyalty tier
- Revenue per product category
- Promo code usage and revenue
- High-value customers segmentation
- Customer behavior and repeat orders

## Instructions
1. Run `schema.sql` to create the tables.
2. Run `seed_data.sql` to populate the tables with sample data.
3. Run queries in `queries.sql` to analyze the business.

## Future Extensions
- Add Returns table to track product returns
- Add Reviews table to analyze customer satisfaction
