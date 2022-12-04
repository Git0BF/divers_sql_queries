--Standard deviation in a discrete normal distribution 

DELETE FROM table
WHERE column < (SELECT AVG(column) - 3 * STDEV(column)
                FROM table)
OR column > (SELECT AVG(column) + 3 * STDEV(column)
             FROM table)
             
-- Interquartile range, keep all the rows between 25% and 75% on a numerical column

DELETE FROM table
WHERE column < (SELECT PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY column)
                FROM table)
OR column > (SELECT PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY column)
             FROM table)
