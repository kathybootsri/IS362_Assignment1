#ASSIGNMENT 1:  23

SELECT DISTINCT COUNT(*)
FROM planes
WHERE speed IS NOT NULL;

#ASSIGNMENT 2: 27188805 for all, 81763 without tail number
SELECT SUM(distance)
FROM flights
WHERE year=2013
and month=1;

SELECT SUM(distance)
FROM flights
WHERE year=2013
and month=1
and (tailnum IS NULL OR tailnum='');

#ASSIGNMENT 3: The left outer join includes the null/blank tail number results, while the inner join only displays results with overlapping tailnumbers.
SELECT p.manufacturer, SUM(distance)
FROM flights f
INNER JOIN planes p on p.tailnum=f.tailnum
WHERE f.year=2013
and f.month=7
and f.day=5
GROUP BY p.manufacturer
ORDER BY SUM(distance) DESC;

SELECT p.manufacturer, SUM(distance)
FROM flights f
LEFT OUTER JOIN planes p on p.tailnum=f.tailnum
WHERE f.year=2013
and f.month=7
and f.day=5
GROUP BY p.manufacturer
ORDER BY SUM(distance) DESC;

#Assignment 4: Which are the top three departing airline/airport combinations with the highest average delays?
SELECT al.name, ap.name, AVG(f.arr_delay) AS 'Average Delay'
FROM flights f
INNER JOIN airports ap on f.origin=ap.faa
INNER JOIN airlines al on al.carrier=f.carrier
GROUP BY al.name, ap.name
ORDER BY AVG(f.arr_delay) ASC
LIMIT 3;
