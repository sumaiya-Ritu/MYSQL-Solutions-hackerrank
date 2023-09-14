select distinct(city) from station where left(city,1) not IN ('a', 'e', 'i', 'o', 'u');
