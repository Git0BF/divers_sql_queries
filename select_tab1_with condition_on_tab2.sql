SELECT *
FROM table_1
WHERE condition IN (SELECT condition
                   FROM table_2)
                   
                   
--With rows selected from multiple tables with condition from one table

SELECT *
FROM table_1
INNER JOIN table_2
ON table_1.id = table_2.id
INNER JOIN table_3
ON table_1.id = table_3.id
WHERE condition IN (SELECT condition
                   FROM table_4)
                   
--Or you can write it in a new table :

CREATE TABLE new_table AS
SELECT *
FROM table_1
INNER JOIN table_2
ON table_1.id = table_2.id
INNER JOIN table_3
ON table_1.id = table_3.id
WHERE condition IN (SELECT condition
                   FROM table_4)                  
