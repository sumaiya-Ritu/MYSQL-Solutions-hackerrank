/*
Enter your query here.
*/WITH RECURSIVE ProjectHierarchy AS (
  SELECT p.Start_Date, p.End_Date
  FROM Projects p
  WHERE NOT EXISTS (SELECT p1.End_Date FROM Projects p1 WHERE p.Start_Date = p1.End_Date)
  UNION ALL
  SELECT eh.Start_Date, p.End_Date
  FROM Projects p
  JOIN ProjectHierarchy eh ON p.Start_Date = eh.End_Date 
)
SELECT Start_Date as s, MAX(End_date) as e FROM ProjectHierarchy 
GROUP BY Start_Date
ORDER BY DATEDIFF(MAX(End_date), Start_Date), Start_Date;
