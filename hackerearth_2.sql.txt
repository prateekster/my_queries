SELECT *
FROM
  (SELECT name,
          count(match_id) AS not_out_count
   FROM Match_data
   WHERE batting_status = 0
   GROUP BY name
   UNION SELECT DISTINCT name,
                         0
   FROM Match_data
   WHERE name NOT IN
       (SELECT name AS not_out_count
        FROM Match_data
        WHERE batting_status = 0
        GROUP BY name) )
ORDER BY name;