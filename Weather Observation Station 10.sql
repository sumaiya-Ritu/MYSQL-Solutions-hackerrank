select distinct(city) from station where Right(city,1) not IN ('a', 'e', 'i', 'o', 'u');
