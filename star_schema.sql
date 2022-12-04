SELECT *
FROM main_table
LEFT JOIN peripheral_table_1
ON main_table.id = peripheral_table_1.main_id
LEFT JOIN peripheral_table_2
ON main_table.id = peripheral_table_2.main_id
LEFT JOIN peripheral_table_3
ON main_table.id = peripheral_table_3.main_id
LEFT JOIN peripheral_table_4
ON main_table.id = peripheral_table_4.main_id
INTO new_table
