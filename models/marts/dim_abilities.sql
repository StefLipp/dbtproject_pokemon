WITH raw_pokemon_reduced AS (SELECT * FROM {{ref('stg_dbtprojectpokemon__raw_pokemon')}}),

trimmed_abilities_table AS (SELECT pokedex_number, replace(replace(abilities, '[', ''), ']', '') as abilities_trim
FROM raw_pokemon_reduced),

split_values_temp AS (
    SELECT pokedex_number,
    SPLIT(abilities_trim, ',') AS split_array
    FROM
    trimmed_abilities_table),

split_values AS (SELECT pokedex_number,
  split_array[OFFSET(0)] AS test1,
  CASE WHEN ARRAY_LENGTH(split_array) > 1 THEN split_array[OFFSET(1)] ELSE NULL END AS test2,
  CASE WHEN ARRAY_LENGTH(split_array) > 2 THEN split_array[OFFSET(2)] ELSE NULL END AS test3,
  CASE WHEN ARRAY_LENGTH(split_array) > 3 THEN split_array[OFFSET(3)] ELSE NULL END AS test4,
  CASE WHEN ARRAY_LENGTH(split_array) > 4 THEN split_array[OFFSET(4)] ELSE NULL END AS test5,
  CASE WHEN ARRAY_LENGTH(split_array) > 5 THEN split_array[OFFSET(5)] ELSE NULL END AS test6
FROM 
  split_values_temp)

SELECT * FROM 
(SELECT pokedex_number, test1 as ability
FROM split_values
UNION DISTINCT
SELECT pokedex_number, test2 as ability
FROM split_values
UNION DISTINCT
SELECT pokedex_number, test3 as ability
FROM split_values
UNION DISTINCT
SELECT pokedex_number, test4 as ability
FROM split_values
UNION DISTINCT
SELECT pokedex_number, test5 as ability
FROM split_values)
WHERE ability IS NOT NULL