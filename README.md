# Customer-and-Sales-Analysis-using-SQL
# Introduction

Microsoft has made available a sample database called AdventureWorks2019 that includes sales and customer information from a made-up cycling business called Adventure Works Cycles. Both experts and novices who are learning SQL frequently utilize this database for practice and learning reasons.

In order to find trends and patterns that help guide corporate strategy and decision-making, we want to examine sales and customer data from the AdventureWorks2019 database in this project. In our work, we will employ ten database tables connected by shared keys and relationships. These tables include `Sales.SalesOrderHeader`, `Sales.Customer`, `Sales.SalesPerson`, `Sales.SalesTerritory`, `Production.Product`, `Sales.SalesOrderDetail`, `Purchasing.PurchaseOrderHeader`, `Purchasing.Vendor`, `Purchasing.PurchaseOrderDetail`, and `Production.WorkOrder`.

Gaining knowledge about consumer behavior, product performance, and sales trends is the main goal of this analysis, which can then be used to inform better corporate strategy and decision-making.

The next parts will give a brief summary of the dataset, go over our method for cleaning and transforming the data, and show our analysis results.

The dataset can be found [here](https://www.google.com/url?sa=t&rct=j&url=https%3A%2F%2Fgithub.com%2FMicrosoft%2Fsql-server-samples%2Freleases%2Fdownload%2Fadventureworks%2FAdventureWorks2019.bak&ved=2ahUKEwia_NCiz9j-AhWNasAKHUsDC5EQFnoECDMQAQ&usg=AOvVaw2o-7zpr66JC5qgwfhuMx7f).

The tool used for this analysis is Microsoft SQL Server Management Studio.

To import a BAK file into SSMS, you can follow these steps:
1. Open SSMS and connect to the server where you want to import the BAK file.
2. Right-click on the “Databases” folder and select “Restore Database."
3. In the “Source” section, select “Device” and click on the “...” button to browse for the BAK file.
4. Select the BAK file and click "OK."
5. In the “Options” section, you can choose the location and file names for the data and log files. You can also specify whether to overwrite the existing database or create a new one.
6. Click on “OK” to start the restore process.
7. Once the restore process is complete, you should be able to access the AdventureWorks2019 database in SSMS.

## Data Dictionary

- **Sales.SalesOrderHeader**: This table contains header information for sales orders, including order ID, order date, customer ID, salesperson ID, and shipping information.
- **Sales.Customer**: This table contains information about customers, including customer ID, name, geographic location, demographic information, and contact information.
- **Sales.SalesPerson**: This table contains information about salespeople, including salesperson ID, name, and demographic information.
- **Sales.SalesTerritory**: This table contains information about sales territories, including territory ID, name, and geographic information.
- **Production.Product**: This table contains information about products, including product ID, name, category, cost, and price.
- **Sales.SalesOrderDetail**: This table contains detailed information about sales orders, including order ID, product ID, quantity, unit price, and discount.
- **Purchasing.PurchaseOrderHeader**: This table contains header information for purchase orders, including order ID, order date, vendor ID, and shipping information.
- **Purchasing.Vendor**: This table contains information about vendors, including vendor ID, name, and contact information.
- **Purchasing.PurchaseOrderDetail**: This table contains detailed information about purchase orders, including order ID, product ID, quantity, unit price, and discount.
- **Production.WorkOrder**: This table contains information about production work orders, including work order ID, product ID, start and end dates, and status.


![image](https://github.com/akinmayor/MHG-Revenue-Improvement-Project-Using-Microsoft-Excel/assets/77463041/6832e540-0077-4c35-a46d-34414ec4707e)


# Data Cleaning

We can report that the data is clean and suitable for analysis after looking into the 10 tables in the AdventureWorks2019 database. There were no severe problems with the data that we could find, such as duplicates, missing numbers, or wrong data types.

In terms of data consistency and accuracy, the tables are free of outliers or anomalies that can affect our study. There are obvious connections between the tables, and the data seems to be arranged nicely.

The data did not require any cleaning or transformation operations because all columns included the right data types and values. To enhance the readability and organization of the table structures, we did make a few minor changes.

Overall, I have confidence in the accuracy of the information and think it will be helpful to our study.

# Questions and Answers
## What are the most popular products among customers?

We have a list of the top 10 items sold in terms of overall quantity based on the provided data. With a total of 8,311 units sold, it appears that the AWC Logo Cap is the best-selling item, followed by the Water Bottle — 30 oz. with 6,815 units sold.

The top five items sold all fall within the category of sporting goods, notably helmets and jerseys, with the Sport-100 Helmet in a variety of colors claiming third to fifth place. With 4,247 pieces sold, the small size of the Classic Vest is the seventh most popular item.

## Which geographic regions generate the most sales?

With a total sales value of $89,228,792.39, the data indicates that North America accounts for the majority of all sales. Following North America, Europe and the Pacific regions are significant contributors, with total sales of $22,173,617.63 and $11,814,376.10, respectively.

## How has sales volume changed over time?

The total sales for each year from 2011 to 2014 are shown in this data. The year with the most sales, 2013, had a total of $48,965,887.96; it was followed by 2012, which had a total of $37,675,700.31. With $22,419,498.32 in total sales, 2014 had the lowest total. It’s crucial to keep in mind that the data only spans four years, making it challenging to draw conclusions about long-term patterns from this data alone.

## Which customer segments generate the most revenue?
![image](https://github.com/akinmayor/MHG-Revenue-Improvement-Project-Using-Microsoft-Excel/assets/77463041/f3a1cb5b-4f68-40ab-b537-c739d34dbde0)

## How effective are promotional campaigns in driving sales?

![image](https://github.com/akinmayor/MHG-Revenue-Improvement-Project-Using-Microsoft-Excel/assets/77463041/facf73e6-7f41-4075-963a-c1cd3c5720ba)

From May 2011 to June 2014, the Total Sales Revenue and whether a promotion was active are shown in this table. We can see that no promotions were active during this time. We can also observe that the Total Sales Revenue changes from month to month, with March 2014 recording the most revenue with a total of 7,217,531.09 and May 2011 recording the lowest revenue with a total of 503,805.92.

## Which salespeople are the most successful?

According to this study, some salespeople appear to have surpassed their sales quotas while others haven’t. Salespeople with high overall sales numbers could be regarded as great performers, while those with low sales numbers might need more assistance or training. Each salesperson’s performance can be measured against the sales quota column.

## How does sales performance vary by geographic region?

According to the data, the Central, Canada, and Southwest regions all have the highest total sales. The territory with the lowest overall sales is Australia, followed by Germany and France. Total sales for the United Kingdom territory are higher than those for the Southeast territory but lower than those for Canada.

## Are there any correlations between salesperson characteristics and performance?

The two variables under analysis have a modest negative association, as indicated by the correlation coefficient of -0.12451099. In other words, there is a weak link between two variables, with one variable gradually decreasing as the other increases. It is important to note that correlation does not imply causation.

## Which territories generate the most revenue?

According to this information, it appears that the Southwest territory has the most total revenue, coming in at $27,150,594.59, followed by Canada and the Northwest, each with $18,398,929.19. Germany, on the other hand, has the lowest overall revenue, coming in at $5,479,819.58.

## How does sales performance vary by territory?

The territories are given in the TotalSales column in descending order of total sales. With a total of $606,380,951.99, the Southwest region had the most sales, followed by the United Kingdom, Central, Northeast, Northwest, Canada, Southeast, France, Germany, and Australia.

According to the AvgOrderQuantity column, there are three orders per order on average across all areas. The average order quantity appears to be the highest in France, at four, and the lowest in Australia, at two.

Finally, according to the AvgOrderValue column, it appears that $1,200 to $1,500 is the average order value across all regions. With an average order value of $1,441.30, the Southwest area leads Central and the United Kingdom. At $1,024.71, Germany has the lowest average order value.

## What are the most profitable products?

According to overall sales, the most popular items are the All-Purpose Bike Stand, HL Mountain Tire, and Mountain Fender Set.

By overall profit, the most profitable items are the All-Purpose Bike Stand, HL Mountain Tire, and Fender Set — Mountain, which each have a 62.6% profit margin.

The top-selling and most profitable products all have a steady profit margin of 62.6%, which shows that these items are priced well.

It’s important to note that none of the goods have a negative profit margin, which indicates that the business is managing its costs and pricing well.

## Are there any patterns or trends in product sales over time?

Following is what we can see from the data:

- From month to month and year to year, sales might vary significantly. For instance, in 2011, October had the biggest sales month with over $4.5 million in sales, while June had the lowest sales month with just under $459,000 in sales.
- Summer and fall seem to be the busiest seasons for sales, with July, August, October, and November standing out as particularly robust ones (which could be as a result of cycling events around summer and fall and Black Friday sales in November).
- In contrast to other months and years, June 2014 sales seem to have decreased significantly. It’s not apparent if this is an unusual occurrence or an indication of a deeper problem within the organization.

## How does product popularity vary by geographic region?

The top-selling item is the AWC Logo Cap, which is followed by the Sport-100 Helmet, Blue, and a 30 oz. water bottle.
The AWC Logo Cap is the best-selling item in the Southwest region, whilst the Sport-100 Helmet, Blue, is the best-selling item in Canada.
The most popular piece of apparel is the Long-Sleeve Logo Jersey, L, which is more popular in the Southwest region than in Canada.
Three distinct colors are available for the Sport-100 Helmet, and they are all among the top 7 sellers. The southwest region is where it is sold the most.
The 30-oz Water Bottle is one of the top 3 items and is more popular in the Southwest region than it is in Canada.

## How does supplier performance vary by product category?

With six sellers mentioned and 303 orders altogether, the Accessories category seems to be the most popular. In order of total expenditure, the top five suppliers are all in the Accessories category, with Professional Athletic Consultants taking the top spot with nearly $3 million spent. With only 2 and 1 order, respectively, The Green Lake Bike Company and International Trek Center had comparatively low sales in this area.

There were eight orders in the category of clothing among the four mentioned. In this area, Integrated Sport Products received the most orders with four, and little over $1 million was spent overall.

The category for components had the most vendors listed (13), with 502 orders overall. With over 4.5 million dollars spent, Superior Bicycles had the most orders and the greatest order volume. There were 40 orders for The Jackson Authority and 42 orders for Compete Enterprises, Inc.

Overall, it appears that the Accessories category is the most well-liked and lucrative one for the business, followed by the Components category. Compared to the other two categories, clothing had lower sales.

## Total Revenue by Order Year and Quarter

The biggest overall revenue, $14,339,319.19, was produced in the third quarter of 2013. Then came 2013’s Q4 ($13,629,621.04 in revenue) and 2013’s Q1 ($8,771,886.36 in revenue).

With $22,196,498.32 in revenue in Q1 and Q2, 2014 had the greatest overall revenue.

On the other side, Q2 2011 revenue was the lowest at $1,074,117.42, and Q3 2011 revenue was also quite low at $5,647,550.66.

Overall, it appears that revenue is rising with time, with the most money coming in the most recent years (2013 and 2014).

## Recommendations

1. **Invest in Marketing for Clothing Category**: Spend money on marketing initiatives for the clothing category because, according to the data, it has the potential to be a top-performing one even though it only contributes a modest amount to overall sales at the moment. The business may be able to boost sales and income by investing in marketing initiatives targeting this market, such as focused advertising or influencer alliances.

2. **Broaden Product Selection for Components Category**: The Components category should broaden its product selection because it is already one of the best-performing areas of the business, contributing significantly to total revenue. The corporation may be able to draw in more clients and boost sales by increasing the product offerings in this area, such as by introducing new brands or product lines.

3. **Focus on Overseas Sales and Diversification**: Increased attention should be paid to overseas sales, which account for a sizable share of the company’s revenue, notably in Europe and Asia. By diversifying its product line and offering related products like clothes and accessories for bicycles, the business can boost sales and attract new clients.

4. **Review Pricing Strategy**: Improve the price plan. According to the study of order and revenue data, the company’s pricing strategy may be able to be improved. For instance, the business can think about modifying prices based on how well-liked a product is or providing discounts for particular products to boost sales.

5. **Enhance Online Sales Experience**: The business might potentially grow its customer base and revenue by putting more of an emphasis on overseas sales, such as by providing worldwide shipping or collaborating with foreign shops. Increased attention should be paid to internet sales, which have been progressively increasing over the past two years. It is advised to concentrate on enhancing all aspects of online purchasing, including website design, product details, and customer service.

6. **Strengthen Vendor Relationships**: Strengthen ties with key vendors: The company’s revenue analysis revealed that a small number of vendors generate the majority of the business’s revenue. Therefore, it is advised to fortify ties with these suppliers in order to secure a reliable supply chain and negotiate advantageous conditions.

7. **Invest in Marketing Initiatives**: Invest in marketing: Although the business has a solid reputation, there might be opportunities to raise brand awareness and draw in new clients through focused marketing initiatives. This could involve working with well-known cycling influencers to promote items or posting advertisements on social media.

## Conclusion

In conclusion, the study of the bicycle sales data has given useful information on the company’s commercial operations. Over the years, the business has been able to increase its revenue steadily, with 2014 being the most fruitful year financially. The company needs to reassess its marketing and sales strategy, though, as there has been a fall in orders in recent years.

The investigation also showed that the Accessories and Components categories, with the former generating more money, are very important to the company’s sales. The business should therefore concentrate its efforts on boosting sales in these areas by providing a wider range of product selections and promotions.

A helpful insight into the performance of the company’s suppliers has also been given by the vendor study. The business ought to think about forming alliances with suppliers who have consistently produced high-quality goods and services while still offering reasonable prices.

Last but not least, the KPI analysis has given the business a basis for evaluating its performance in a number of categories, such as revenue, order volume, and customer happiness. To make sure it is reaching its business goals, the corporation should continue to track and assess these KPIs.

Based on these conclusions, it is advised that the business create and implement a thorough sales and marketing strategy with a special emphasis on growing sales in the Accessories and Components categories while also collaborating with top vendors to improve customer satisfaction. To make sure it is on course to meet its business goals, the organization needs to keep checking its KPIs.

