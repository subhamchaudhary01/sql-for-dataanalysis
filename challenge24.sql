-- HackerRank Advance Problems
/*
there is a table with daily weather data over the last 6 months of 2020, including the maximum, minimum and average temperatures. Write a query that gives month, monthly maximum, monthly minimum, monthly average temperatures for six months. Round the average to nearest integer.
*/

SELECT
    MONTH(record_date) AS month,
    MAX(CASE WHEN data_type = 'max' THEN data_value END) AS monthly_max,
    MIN(CASE WHEN data_type = 'min' THEN data_value END) AS monthly_min,
    ROUND(AVG(CASE WHEN data_type = 'avg' THEN data_value END)) AS monthly_avg
FROM temperature_records
GROUP BY MONTH(record_date)
ORDER BY month;
