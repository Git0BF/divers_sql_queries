SELECT *
FROM table_1
WHERE condition IN (SELECT condition
                   FROM table_2)
