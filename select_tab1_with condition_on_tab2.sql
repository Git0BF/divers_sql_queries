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


--Or you can select rows in one table based on condition on multiple tables

SELECT *
FROM table_1
WHERE condition_1 IN (SELECT condition_1
                      FROM table_2
                      WHERE condition_2 IN (SELECT condition_2
                                            FROM table_3))
