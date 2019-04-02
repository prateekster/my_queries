SELECT muid "UserId",
       name "Name"
FROM
  (SELECT max(userid) muid,
          name
   FROM Users u1
   WHERE regexp_count(u1.name, substr(u1.name, 1, 1), 1, 'i') != LENGTH (u1.name)
   GROUP BY u1.name) u2
ORDER BY muid ;