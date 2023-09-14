SELECT Name FROM Students
JOIN Friends USING (ID)
JOIN Packages AS student_salary USING (ID) 
JOIN Packages AS friend_salary ON friend_salary.ID = Friends.Friend_ID
WHERE friend_salary.Salary > student_salary.Salary
ORDER BY friend_salary.salary;
