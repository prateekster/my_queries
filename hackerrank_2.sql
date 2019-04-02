SELECT CASE
           WHEN gr <8 THEN NULL
           ELSE name
       END,
       gr,
       marks
FROM
  (SELECT name,

     (SELECT grade
      FROM grades
      WHERE marks BETWEEN min_mark AND max_mark) gr,
          marks
   FROM students)
ORDER BY gr DESC nulls LAST,
                       name;