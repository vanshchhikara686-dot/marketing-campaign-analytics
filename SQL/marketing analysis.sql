SELECT TOP (1000) [month]
      ,[campaign_id]
      ,[channel]
      ,[campaign_type]
      ,[campaign_name]
      ,[Spend_INR]
      ,[Impressions]
      ,[Clicks]
      ,[Conversions]
      ,[Attributed_Revenue_INR]
  FROM [Marketing_Analytics].[dbo].[campaign_performance]




  USE Marketing_Analytics;
GO

SELECT 
    name AS Table_Name,
    create_date
FROM sys.tables
ORDER BY create_date;

SELECT COUNT(*) AS Rows_In_Imported_Table
FROM [dbo].[Marketing_Campaign_ROI_Analytics_Dataset];

drop table campaign_performance
EXEC sp_rename 
    'dbo.Marketing_Campaign_ROI_Analytics_Dataset',
    'Campaign_Performance';

    select * from Campaign_Performance



    select top 10 * from Campaign_Performance


    select sum(spend_inr) [total spend] from campaign_performance
    select sum(impressions)[total impressions] from campaign_performance
    select sum(clicks) [total clicks] from campaign_performance
    select sum(conversions)[total conversions] from campaign_performance
    select sum(attributed_revenue_inr) [total revenue] from campaign_performance

    select  campaign_name from campaign_performance

 
 select channel, 
 sum(spend_inr) [total_spend],
 sum (clicks) [total_clicks],
 sum(conversions) [total_conversions],
 sum(attributed_revenue_inr) [total_revenue]
 from campaign_performance
 group by channel 
 order by Total_Revenue desc;

 SELECT
    Channel,
    SUM(Spend_INR) AS Total_Spend,
    SUM(Clicks) AS Total_Clicks,
    SUM(Conversions) AS Total_Conversions,
    SUM(Attributed_Revenue_INR) AS Total_Revenue
FROM Campaign_Performance
GROUP BY Channel
ORDER BY Total_Revenue DESC;



select campaign_name,
sum(spend_inr) as [total_spend],
sum(clicks) as [total_clicks],
sum(conversions)as[total_conversion],
sum(attributed_revenue_inr)as [total_revenue]
from Campaign_Performance
group by campaign_name
order by total_revenue desc;



select campaign_name,
sum(attributed_revenue_inr) as [highest_revenue]
from campaign_performance
group by campaign_name
order by highest_revenue desc;


select
channel,
sum(spend_inr)as[total_spend],
sum(attributed_revenue_inr)as[total_revenue],
round(sum(attributed_revenue_inr)/ nullif(sum(spend_inr),0),
2
)as roas
from campaign_performance
group by channel
order by roas desc;

select channel,
sum(spend_inr)as[total_spend],
sum(conversions)as[total_conversions],
round(sum(spend_inr)/ nullif(sum(conversions),0),
2
)as cpa 
from campaign_performance
group by channel 
order by cpa asc;


select channel,
sum(clicks)as[total_clicks],
sum(conversions)as[total_conversions],
round(sum(clicks)*100/nullif(sum(conversions),0),
2
)as cpa
from campaign_performance
group by channel
order by cpa desc;


select channel,
sum(clicks)as[toal_clicks],
sum(impressions)as[total_impressions],
round(sum(clicks)*100/nullif(sum(impressions),0),
2
)as ctr_percent
from campaign_performance
group by channel
order by ctr_percent desc;
SELECT
    Channel,
    SUM(Spend_INR) AS Total_Spend,
    SUM(Attributed_Revenue_INR) AS Total_Revenue,
    ROUND(
        (SUM(Attributed_Revenue_INR) - SUM(Spend_INR))
        * 100.0 / NULLIF(SUM(Spend_INR), 0),
        2
    ) AS ROI_Percent
FROM Campaign_Performance
GROUP BY Channel
ORDER BY ROI_Percent DESC;
use Marketing_Analytics

select top 5 
campaign_name,
sum(spend_inr)as [total_spend],
sum(attributed_revenue_inr)as[total_revenue],
round(
sum(attributed_revenue_inr)/nullif (sum(spend_inr),0),
2
)as roas
from campaign_performance
where spend_inr > 0
group by campaign_name 
order by roas desc ;

   
select top 3
campaign_name,
sum(spend_inr)as [total_spend],
sum(attributed_revenue_inr)as[total_revenue],
round(
sum(attributed_revenue_inr)/nullif (sum(spend_inr),0),
2
)as roas
from campaign_performance


select 
camapign_name,
sum(spend_inr)as[total_spend],
sum(attributed_revenue_inr)as[total_revenue],
round(
sum(attributed_revenue_inr)/nullif (sum(spend_inr),0),
2
)as roas
from campaign_performance
where spend_inr > 0
group by campaign_name
HAVING SUM(Attributed_Revenue_INR) / NULLIF(SUM(Spend_INR), 0) > 30
ORDER BY ROAS DESC;

SELECT
    Campaign_Name,
    SUM(Spend_INR) AS Total_Spend,
    SUM(Attributed_Revenue_INR) AS Total_Revenue,
    ROUND(
        SUM(Attributed_Revenue_INR) / NULLIF(SUM(Spend_INR), 0),
        2
    ) AS ROAS
FROM Campaign_Performance
WHERE Spend_INR > 0

SELECT
    Campaign_Name,
    SUM(Spend_INR) AS Total_Spend,
    SUM(Attributed_Revenue_INR) AS Total_Revenue,
    ROUND(
        SUM(Attributed_Revenue_INR) / NULLIF(SUM(Spend_INR), 0),
        2
    ) AS ROAS
FROM Campaign_Performance
WHERE Spend_INR > 0
GROUP BY Campaign_Name
having sum(attributed_revenue_inr)/nullif(sum(spend_inr),0)<25
order by roas asc;


GROUP BY Campaign_Name
HAVING SUM(Attributed_Revenue_INR) / NULLIF(SUM(Spend_INR), 0) > 30
ORDER BY ROAS DESC;

select 
campaign_name,
sum(spend_inr)as [total_spend],
sum(attributed_revenue_inr)as[total_revenue],
round(
sum(attributed_revenue_inr)/ nullif (sum(spend_inr),0),
2
)as roas
from campaign_performance
where spend_inr > 0
GROUP BY Campaign_Name
ORDER BY Total_Revenue DESC;


select 
month,
sum(spend_inr)as[total_revenue],
sum(attributed_revenue_inr)as[total_revenue],
sum(conversions)as[total_conversions],
round(
sum(attributed_revenue_inr)/nullif(sum(spend_inr),0),
2
)as roas
from campaign_performance
group by month 
order by month ;

SELECT TOP 1
    Month,
    SUM(Attributed_Revenue_INR) AS Total_Revenue
FROM Campaign_Performance
GROUP BY Month
ORDER BY Total_Revenue DESC;




select top 1
month,
sum(spend_inr)as[total_spend],
sum(attributed_revenue_inr)as[total_revenue],
round(
sum(attributed_revenue_inr)/nullif(sum(spend_inr),0),
2
) as roas 
from campaign_performance
group by month 

with monthly revenue as(
select
month,
sum(attributed_revenue_inr)as[total_revenue]
from campaign_performance
group by month
)
select month,
total_revenue,
lag Total_Revenue) OVER (ORDER BY Month) AS Previous_Month_Revenue,
    ROUND(
        (Total_Revenue - LAG(Total_Revenue) OVER (ORDER BY Month))
        * 100.0
        / NULLIF(LAG(Total_Revenue) OVER (ORDER BY Month), 0),
        2
    ) AS Revenue_Growth_Percent
FROM MonthlyRevenue
ORDER BY Month;


order by  SUM(Attributed_Revenue_INR) / NULLIF(SUM(Spend_INR), 0) DESC;
WITH MonthlyRevenue AS (
    SELECT
        Month,
        SUM(Attributed_Revenue_INR) AS Total_Revenue
    FROM Campaign_Performance
    GROUP BY Month
)
SELECT
    Month,
    Total_Revenue,
    LAG(Total_Revenue) OVER (ORDER BY Month) AS Previous_Month_Revenue,
    ROUND(
        (Total_Revenue - LAG(Total_Revenue) OVER (ORDER BY Month))
        * 100.0
        / NULLIF(LAG(Total_Revenue) OVER (ORDER BY Month), 0),
        2
    ) AS Revenue_Growth_Percent
FROM MonthlyRevenue
ORDER BY Month;


select 
channel,
camapign_name,
sum(attributed_revenue_inr)as[total_revenue],
rank() over(
partition by channel
order by sum(attributed_revenue_inr) desc
)as revenue rank
FROM Campaign_Performance
GROUP BY Channel, Campaign_Name
ORDER BY Channel, Revenue_Rank;

SELECT
    Channel,
    Campaign_Name,
    SUM(Attributed_Revenue_INR) AS Total_Revenue,
    RANK() OVER (
        PARTITION BY Channel
        ORDER BY SUM(Attributed_Revenue_INR) DESC
    ) AS Revenue_Rank
FROM Campaign_Performance
GROUP BY Channel, Campaign_Name
ORDER BY Channel, Revenue_Rank;


WITH CampaignRanking AS (
    SELECT
        Channel,
        Campaign_Name,
        SUM(Attributed_Revenue_INR) AS Total_Revenue,
        RANK() OVER (
            PARTITION BY Channel
            ORDER BY SUM(Attributed_Revenue_INR) DESC
        ) AS Revenue_Rank
    FROM Campaign_Performance
    GROUP BY Channel, Campaign_Name
)
SELECT
    Channel,
    Campaign_Name,
    Total_Revenue
FROM CampaignRanking
WHERE Revenue_Rank = 1
ORDER BY Total_Revenue DESC;

SELECT
    Channel,
    SUM(Attributed_Revenue_INR) AS Total_Revenue,
    ROUND(
        SUM(Attributed_Revenue_INR) * 100.0 /
        SUM(SUM(Attributed_Revenue_INR)) OVER (),
        2
    ) AS Revenue_Contribution_Percent
FROM Campaign_Performance
GROUP BY Channel
ORDER BY Revenue_Contribution_Percent DESC;

SELECT
    Channel,
    SUM(Spend_INR) AS Total_Spend,
    SUM(Attributed_Revenue_INR) AS Total_Revenue,
    ROUND(
        SUM(Attributed_Revenue_INR) /
        NULLIF(SUM(Spend_INR), 0),
        2
    ) AS ROAS,
    CASE
        WHEN SUM(Spend_INR) = 0 THEN 'Organic'
        WHEN SUM(Attributed_Revenue_INR) /
             NULLIF(SUM(Spend_INR), 0) >= 30 THEN 'Scale'
        WHEN SUM(Attributed_Revenue_INR) /
             NULLIF(SUM(Spend_INR), 0) >= 25 THEN 'Optimize'
        ELSE 'Review'
    END AS Budget_Recommendation
FROM Campaign_Performance
GROUP BY Channel
ORDER BY ROAS DESC;
SELECT
    Channel,
    SUM(Spend_INR) AS Total_Spend,
    SUM(Attributed_Revenue_INR) AS Total_Revenue,
    ROUND(
        SUM(Attributed_Revenue_INR) /
        NULLIF(SUM(Spend_INR), 0),
        2
    ) AS ROAS,
    CASE
        WHEN SUM(Spend_INR) = 0 THEN 'Organic'
        WHEN SUM(Attributed_Revenue_INR) /
             NULLIF(SUM(Spend_INR), 0) >= 30 THEN 'Scale'
        WHEN SUM(Attributed_Revenue_INR) /
             NULLIF(SUM(Spend_INR), 0) >= 25 THEN 'Optimize'
        ELSE 'Review'
    END AS Budget_Recommendation
FROM Campaign_Performance
GROUP BY Channel
ORDER BY ROAS DESC;