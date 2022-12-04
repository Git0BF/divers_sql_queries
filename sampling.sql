-- Random sampling

SELECT *
FROM mytable
WHERE RAND() <= 0.1  -- Select 10% of the rows


-- stratified sampling


SELECT *
FROM mytable
WHERE (age >= 18 AND age < 25 AND RAND() <= 0.5)  -- Select 50% of rows in the 18-24 age group
   OR (age >= 25 AND age < 35 AND RAND() <= 0.3)  -- Select 30% of rows in the 25-34 age group
   OR (age >= 35 AND age < 45 AND RAND() <= 0.2)  -- Select 20% of rows in the 35-44 age group
   OR (age >= 45 AND age < 55 AND RAND() <= 0.1)  -- Select 10% of rows in the 45-54 age group


--Cluster Sampling 


SELECT *
FROM mytable
WHERE (city IN ('New York', 'Boston', 'Chicago') AND RAND() <= 0.5)  -- Select 50% of rows from the selected cities
   OR (city IN ('Los Angeles', 'San Francisco', 'Seattle') AND RAND() <= 0.3)  -- Select 30% of rows from the selected cities
   OR (city IN ('Miami', 'Houston', 'Dallas') AND RAND() <= 0.2)  -- Select 20% of rows from the selected cities
   OR (city IN ('Atlanta', 'Philadelphia', 'Washington') AND RAND() <= 0.1)  -- Select 10% of rows from the selected cities


--Multistage sampling (combination of the above)


-- Stage 1: Select a random subset of cities
SELECT city
FROM mytable
GROUP BY city
HAVING RAND() <= 0.5

-- Stage 2: Select a random subset of neighborhoods within each selected city
SELECT neighborhood
FROM mytable
WHERE city IN (
  SELECT city
  FROM mytable
  GROUP BY city
  HAVING RAND() <= 0.5
)
GROUP BY neighborhood
HAVING RAND() <= 0.3

-- Stage 3: Select a random subset of households within each selected neighborhood
SELECT *
FROM mytable
WHERE city IN (
  SELECT city
  FROM mytable
  GROUP BY city
  HAVING RAND() <= 0.5
)
AND neighborhood IN (
  SELECT neighborhood
  FROM mytable
  WHERE city IN (
    SELECT city
    FROM mytable
    GROUP BY city
    HAVING RAND() <= 0.5
  )
  GROUP BY neighborhood
  HAVING RAND() <= 0.3
)
HAVING RAND() <= 0.1
