With raw_pokemon_reduced AS (SELECT * FROM {{ref("stg_dbtprojectpokemon__raw_pokemon")}})

SELECT 
pokedex_number,
attack,
base_total,
defense,
hp,
sp_attack,
sp_defense,
speed
FROM
raw_pokemon_reduced