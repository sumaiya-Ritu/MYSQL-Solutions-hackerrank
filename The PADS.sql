select CONCAT(s.name, '(', (LEFT(s.occupation, 1)), ')') from occupations as s
    
    group by s.name, s.occupation
    order by s.name, s.occupation;
    
select CONCAT('There are a total of ', COUNT(occupation), ' ', lower(occupation), 's.') from occupations
group by occupation
order by  COUNT(occupation), occupation;
