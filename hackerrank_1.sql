SELECT Doctor,
       Professor,
       Singer,
       Actor
FROM
  (SELECT Name,
          Occupation,
          row_number() over(PARTITION BY Occupation
                            ORDER BY Name) rn
   FROM Occupations) AS SOURCE pivot (max(name)
                                      FOR Occupation IN (Doctor, Professor, Singer, Actor)) AS PVT;