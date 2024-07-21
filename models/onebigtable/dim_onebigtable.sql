WITH dim_abilities as (SELECT * FROM {{ref('dim_abilities')}}),
dim_pokemon_characteristics as (SELECT * FROM {{ref('dim_pokemon_characteristics')}}),
dim_types as (SELECT * FROM {{ref('dim_types')}}),
fct_pokemon_battle as (SELECT * FROM {{ref('fct_pokemon_battle')}})

SELECT 
b.pokedex_number,
attack,
base_total,
defense,
hp,
sp_attack,
sp_defense,
speed,
name,
base_egg_steps,
base_happiness,
capture_rate,
classfication,
experience_growth,
percentage_male,
generation,
is_legendary,
type,
ability
FROM fct_pokemon_battle b
LEFT JOIN dim_pokemon_characteristics c ON b.pokedex_number = c.pokedex_number
LEFT JOIN dim_types t ON b.pokedex_number = t.pokedex_number
LEFT JOIN dim_abilities a ON b.pokedex_number = a.pokedex_number