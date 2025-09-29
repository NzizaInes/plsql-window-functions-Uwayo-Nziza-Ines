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
  
  ```sql
  --snippet from schema.sql
  --Customers
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
c_name VARCHAR(200) NOT NULL,
region VARCHAR(100)
);

  

  
    
