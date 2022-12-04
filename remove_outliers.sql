--Standard deviation in a discrete normal distribution 

DELETE FROM table
WHERE column < (SELECT AVG(column) - 3 * STDEV(column)
                FROM table)
OR column > (SELECT AVG(column) + 3 * STDEV(column)
             FROM table)
