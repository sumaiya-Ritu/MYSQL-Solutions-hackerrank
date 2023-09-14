select distinct city, length(city) from station 
  where length(city) = (select max(length(city)) from station) 
  or length(city) = (select min(length(city)) from station ) 
  order by length(city) desc limit 2;
