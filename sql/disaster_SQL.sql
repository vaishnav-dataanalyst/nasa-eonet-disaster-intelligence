CREATE DATABASE disaster_management;

use disaster_management;

CREATE TABLE disaster_events (
    event_id VARCHAR(50),
    title TEXT,
    category VARCHAR(100),
    disaster_type_group VARCHAR(100),
    date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    source VARCHAR(100),
    latitude FLOAT,
    longitude FLOAT,
    region VARCHAR(100),
    event_age_days INT,
    event_age_category VARCHAR(50),
    status VARCHAR(50),
    severity VARCHAR(50),
    risk_score INT,
    data_collection_date DATE
);


select * from disaster_events;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- OBJCECTIVE QNS --

-- 1 Total Number of Disaster Events

SELECT COUNT(*) AS Total_Events
FROM disaster_events;

-- 2. Total Active Disaster Events -- 

SELECT COUNT(*) AS Active_Events
FROM disaster_events
WHERE status = 'Active';

-- 3. Total Closed Disaster Events -- 

SELECT COUNT(*) AS Closed_Events
FROM disaster_events
WHERE status = 'Closed';

-- 4. Count of Events by Disaster Category --

SELECT category, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY category
ORDER BY Total_Events DESC;

-- 5. Region-wise Disaster Distribution --

SELECT region, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY region
ORDER BY Total_Events DESC;

-- 6. Severity-wise Disaster Analysis -- 

SELECT severity, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY severity;

-- 7. Monthly Disaster Trend Analysis -- 

SELECT month_name, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY month_name
ORDER BY Total_Events DESC;

-- 8. Yearly Disaster Trend Analysis --

SELECT year, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY year
ORDER BY year desc;

-- 9. Most Frequently Occurring Disaster Type -- 

SELECT category, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY category
ORDER BY Total_Events DESC
LIMIT 1;

-- 10. List of High Severity Disaster Events --

SELECT *
FROM disaster_events
WHERE severity = 'High';

-- 11. Disaster Events in North America -- 

SELECT *
FROM disaster_events
WHERE region = 'North America';

-- 12. Events Older Than 90 Days --

SELECT *
FROM disaster_events
WHERE event_age_days > 90;

-- 13. Recently Reported Disaster Events -- 

SELECT *
FROM disaster_events
WHERE event_age_category = 'Recent';

-- 14. Monitoring Status Events --

SELECT *
FROM disaster_events
WHERE status = 'Monitoring';

-- 15. Average Risk Score Across Events -- 

SELECT AVG(risk_score) AS Average_Risk_Score
FROM disaster_events;

-- 16. Maximum Risk Score Recorded -- 

SELECT MAX(risk_score) AS Highest_Risk_Score
FROM disaster_events;

-- 17. Disaster Type Group Analysis -- 

SELECT disaster_type_group, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY disaster_type_group;

-- 18. Events Collected on Latest available date -- 

SELECT *
FROM disaster_events
WHERE data_collection_date = (
    SELECT MAX(data_collection_date)
    FROM disaster_events
);

-- 19. Top 5 Oldest Disaster Events -- 

SELECT title, event_age_days
FROM disaster_events
ORDER BY event_age_days DESC
LIMIT 5;

-- 20. Count of Events by Status -- 

SELECT status, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY status;

-- 21. Disaster Events Reported in 2025 --

SELECT *
FROM disaster_events
WHERE year = 2025;

-- 22. Total Events by Month Name -- 

SELECT month_name, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY month_name;

-- 23. High Severity Wildfire Events -- 

SELECT *
FROM disaster_events
WHERE category = 'Wildfires'
AND severity = 'High';

-- 24. Region-wise Average Risk Score -- 

SELECT region, AVG(risk_score) AS Average_Risk
FROM disaster_events
GROUP BY region; 

-- 25. Latest 10 Disaster Events --

SELECT *
FROM disaster_events
ORDER BY date DESC
LIMIT 10;

-- 26. Top 3 Most Affected Regions -- 
 
SELECT region, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY region
ORDER BY Total_Events DESC
LIMIT 3;

-- 27. Count of Climate-related Disasters -- 

SELECT COUNT(*) AS Climate_Disasters
FROM disaster_events
WHERE disaster_type_group = 'Climate';

-- 28. Count of Geological Disasters --

SELECT COUNT(*) AS Geological_Disasters
FROM disaster_events
WHERE disaster_type_group = 'Geological';

-- 29. Disaster Events with Risk Score Greater Than 2 -- 

SELECT *
FROM disaster_events
WHERE risk_score > 2;

-- 30. Average Event Age by Category -- 

SELECT 
    category,
    ROUND(AVG(event_age_days), 2) AS Average_Event_Age_Days
FROM disaster_events
GROUP BY category
ORDER BY Average_Event_Age_Days DESC;

-- 31. Region-wise Severity Distribution -- 

SELECT region, severity, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY region, severity
ORDER BY region;

-- 32. Most Recent Active Disaster Events -- 

SELECT *
FROM disaster_events
WHERE status = 'Active'
ORDER BY date DESC;

-- 33. Count of Events by Month and Severity -- 

SELECT month_name, severity, COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY month_name, severity;

-- 34. Disaster Events from Environmental Group --

SELECT *
FROM disaster_events
WHERE disaster_type_group = 'Environmental';

-- 35. Top 5 Highest Risk Disaster Categories -- 

SELECT category,
AVG(risk_score) AS Average_Risk
FROM disaster_events
GROUP BY category
ORDER BY Average_Risk DESC
LIMIT 5;

-- 36. Number of Events by Event Age Category -- 

SELECT event_age_category,
COUNT(*) AS Total_Events
FROM disaster_events
GROUP BY event_age_category;

