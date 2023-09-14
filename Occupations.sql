SELECT MAX(DOCTOR) AS Doctor, 
MAX(PROFESSOR) AS Professor, 
MAX(SINGER) AS Singer, 
MAX(ACTOR) AS Actor FROM 
( 
    SELECT 
    CASE WHEN Occupation = 'Doctor' THEN Name 
    END AS DOCTOR, 
    CASE WHEN Occupation = 'Professor' THEN Name 
    END AS PROFESSOR, 
    CASE WHEN Occupation = 'Singer' THEN Name
    END AS SINGER, 
    CASE WHEN Occupation = 'Actor' THEN Name 
    END AS ACTOR, 
    ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn FROM OCCUPATIONS ) 
    AS PivotTable 
    GROUP BY rn ORDER BY rn;
