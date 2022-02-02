SELECT name, COUNT(email) 
FROM users
GROUP BY email
HAVING COUNT(email) > 1
