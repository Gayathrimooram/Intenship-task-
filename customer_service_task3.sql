SELECT * FROM db2.customer_data;

-- count tickets
SELECT COUNT(*) AS total_tickets
FROM db2.customer_data;

-- Average CSAT Score per  Supervisor
SELECT Agent_name, AVG(`CSAT Score`) AS avg_csat
FROM db2.customer_data
GROUP BY Agent_name
ORDER BY avg_csat DESC;

-- Total Number of Issues Handled by Category
SELECT category, COUNT(`Unique id`) AS total_issues
FROM db2.customer_data
GROUP BY category
ORDER BY total_issues DESC;

-- Average Handling Time per Agent
SELECT Agent_name, AVG(connected_handling_time) AS avg_time
FROM db2.customer_data
GROUP BY Agent_name;

-- Response Time (Reported vs Responded)
SELECT 
  `Unique id`,
  TIMESTAMPDIFF(MINUTE, STR_TO_DATE(`Issue_reported at`, '%d-%m-%Y %H:%i'), STR_TO_DATE(issue_responded, '%d-%m-%Y %H:%i')) AS response_time_minutes
FROM db2.customer_data;

-- Shift-wise CSAT Analysis
SELECT `Agent Shift`, AVG(`CSAT Score`) AS avg_csat
FROM db2.customer_data
GROUP BY `Agent Shift`;

-- Average CSAT Score per Agent
SELECT agent_name, ROUND(AVG(connected_handling_time), 2) AS avg_handling_time
FROM db2.customer_data
GROUP BY agent_name
ORDER BY avg_handling_time DESC;

-- City-wise Item Price Analysis
SELECT Customer_City, AVG(Item_price) AS avg_price
FROM db2.customer_data
GROUP BY Customer_City
ORDER BY avg_price DESC;

-- Total Revenue from Resolved Issues
SELECT SUM(Item_price) AS total_revenue
FROM db2.customer_data;

-- Create a View for Quick Access
CREATE VIEW Agent2 AS
SELECT 
  Agent_name,
  AVG(`CSAT Score`) AS avg_csat,
  AVG(connected_handling_time) AS avg_time,
  COUNT(`Unique id`) AS issues_handled
FROM db2.customer_data
GROUP BY Agent_name;

-- Optimize Queries with Indexes
CREATE INDEX idx_agent ON db2.customer_data (Agent_name);
CREATE INDEX idx_category ON db2.customer_data (category);
CREATE INDEX idx_reported_time ON db2.customer_data (`Issue_reported at`);













