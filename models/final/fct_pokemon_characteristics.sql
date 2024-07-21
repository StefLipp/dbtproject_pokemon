WITH raw_pokemon_reduced AS (SELECT * FROM {{ref('stg_dbtprojectpokemon__raw_pokemon')}})

SELECT
pokedex_number,
name,
base_egg_steps,
base_happiness,
capture_rate,
classfication,
experience_growth,
height_m,
percentage_male,
weight_kg,
generation,
is_legendary
FROM raw_pokemon_reduced