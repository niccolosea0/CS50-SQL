-- Write a SQL query to find the titles of episodes that have aired during the holiday season, usually in December in the United States
SELECT "title"
FROM "episodes"
WHERE strftime('%m', "air_date") = '12';
