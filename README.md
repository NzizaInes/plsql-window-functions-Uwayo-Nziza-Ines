PLSQL WINDOW FUNCTIONS PROJECT

Written by: UWAYO Nziza Ines

**1. PROBLEM STATEMENT**
The sales department of a retail company in Rwanda wants to analyze product performance and customer spending across different regions.  
Currently, management lacks clear insights into which products perform best, how customer spending evolves over time, and how to group customers for targeted marketing.  

Expected Outcome:
- Identify top-performing products per region and quarter.
- Track customer spending trends and growth.
- Segment customers into quartiles and percentiles for loyalty programs.

  **2. DATABASE SCHEMA**
  The Database was implemented using the following sql script: [schema.sql](scripts/schema.sql)
  
- **customers**: customer_id (PK), name, region  
- **products**: product_id (PK), name, category  
- **transactions**: transaction_id (PK), customer_id (FK), product_id (FK), sale_date, amount

  **3. Querries**
- **Ranking Functions**:

    Querries: [window_function_querries.sql](scripts/schema.sql)

    Use case: Top products by revenue per region/quarter
        [rank().png](screenshots/rank().png)

 -**Aggregate Functions**:

  Querries:  [window_function_querries.sql](scripts/schema.sql)

  Use case: Running totals, moving average, frame comparison
      [sum_running_total.png](screenshots/sum_running_total.png)
      [AVG_moving_average.png](screenshots/AVG_moving_average.png)

 -**Navigation Funtions**:

  Querries:  [window_function_querries.sql](scripts/schema.sql)

  Use case: Period-to-Period Analysis
      [LAG().png](screenshots/LAG().png)
      [LEAD.png](screenshots/LEAD.png)

-**Distribution Functions**:

  Querries:  [window_function_querries.sql](scripts/schema.sql)

  Use case: Customer segmentation into quartiles & percentiles
       [NTILE(4).png](screenshots/NTILE(4).png)
       [CUME_DIST().png](screenshots/CUME_DIST.png)


**4. Results Analysis**

   **Descriptive (What happened?)**
   
-Transactions cover Feb → Apr 2025, with steady sales each month.

-Rice (Grains) and Milk Powder (Dairy) are among the most frequently purchased products.

-Customers 1002 and 1006 appear multiple times, indicating repeat purchases.

-Household items like Coffee Beans and Cheese had smaller but consistent contributions.

   **Diagnostic (Why did it happen?)**
   
- The dominance of Rice and Milk Powder reflects essential food demand. These are staples, so customers buy them repeatedly.
- 
- Customers 1002 and 1006 are located in regions with higher frequency of purchases. This suggests regional demand differences.
- 
- Higher-value items (Cooking Oil, Coffee Beans) are less frequent, possibly due to higher prices or being less essential day-to-day.

    **Prescriptive (What next?)**
  
- Inventory: Ensure stable stock of Rice and Milk Powder, since they drive recurring sales.
  
- Customer Strategy:
  
Reward loyal/repeat customers (1002, 1006) with discounts or loyalty points.

Engage less active customers with targeted promotions.

- Product Focus:
  
Promote Cooking Oil and Coffee Beans during seasonal peaks (e.g., festivals) to boost demand.

Bundle essential products (Rice + Milk Powder) with less frequent items (Cheese, Coffee Beans) to cross-sell.

- Monitoring: Keep tracking month-over-month growth % to spot when demand shifts from essentials to non-essentials.

    **5. References:**
PostgreSQL Window Functions Tutorial – https://www.postgresqltutorial.com/postgresql-window-function/

“SQL Window Functions: A Comprehensive Guide” – TutorialPoint

W3Schools SQL Tutorial – https://www.w3schools.com/sql/

Oracle PLSQL Documentation – https://docs.oracle.com/en/database/oracle/oracle-database/

Tutorial on using aggregate functions as window functions
https://coderpad.io/blog/development/window-functions-aggregate-data-postgres/

“Analyzing Data with SQL Window Functions” – Medium Article

Academic Paper: “Window Functions in Database Systems” – ACM Digital Library

Stack Overflow discussions on window functions

Oracle Live SQL Examples – https://livesql.oracle.com/

PostgreSQL Official – Window Functions (tutorial)
https://www.postgresql.org/docs/current/tutorial-window.html


**Statement on Originality:**
 “All sources were properly cited. Implementations and analysis represent original work. No AI
generated content was copied without attribution or adaptation.”


  
    
