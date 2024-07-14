WITH raw_pokemon_reduced AS (SELECT * FROM {{ref('stg_dbtprojectpokemon__raw_pokemon')}}),

type1table AS (SELECT
pokedex_number, type1 as type
FROM raw_pokemon_reduced),

type2table AS (SELECT
pokedex_number, type2 as type
FROM raw_pokemon_reduced
WHERE type2 IS NOT null)

SELECT * FROM type1table
UNION DISTINCT 
SELECT * FROM type2table