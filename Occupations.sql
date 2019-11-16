/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.
Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.
*/


SELECT doctor,
       professor,
       singer,
       actor
FROM   (SELECT NAME,
               occupation,
               Row_number()
                 OVER(
                   partition BY occupation
                   ORDER BY NAME) rn
        FROM   occupations) AS source
       PIVOT ( Max(NAME)
             FOR occupation IN (doctor,
                                professor,
                                singer,
                                actor) ) AS pvt; 
