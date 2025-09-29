PLSQL WINDOW FUNCTIONS PROJECT

Written by: UWAYO Nziza Ines

     1. PROBLEM STATEMENT
The sales department of a retail company in Rwanda wants to analyze product performance and customer spending across different regions.  
Currently, management lacks clear insights into which products perform best, how customer spending evolves over time, and how to group customers for targeted marketing.  

Expected Outcome:
- Identify top-performing products per region and quarter.
- Track customer spending trends and growth.
- Segment customers into quartiles and percentiles for loyalty programs.

       2. DATABASE SCHEMA
  The Database was implemented using the following sql script: [schema.sql](scripts/schema.sql)
  
- **customers**: customer_id (PK), name, region  
- **products**: product_id (PK), name, category  
- **transactions**: transaction_id (PK), customer_id (FK), product_id (FK), sale_date, amount

       3. Querries
- **Ranking Functions**:

    Querries: [window_function_querries.sql](scripts/schema.sql)

    Use case: Top products by revenue per region/quarter
        [rank().png](screenshots/rank().png)

 -**Aggregate Functions**:

  Querries:  [window_function_querries.sql](scripts/schema.sql)

  Use case: Running totals, moving average, frame comparison
      [sum_running_total.png](screenshots/sum_running_total.png)
      [AVG moving average.png](screenshots/AVG moving average.png)

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


                 **Results Analysis**

  
    
