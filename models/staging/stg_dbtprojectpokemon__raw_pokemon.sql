WITH raw_pokemon AS (
  SELECT * FROM {{ source('dbtprojectpokemon_sl', 'raw_pokemon') }}
)

SELECT 
  abilities,
  attack,
  base_egg_steps,
  base_happiness,
  base_total,
  capture_rate,
  classfication,
  defense,
  experience_growth,
  hp,
  name,
  percentage_male,
  pokedex_number,
  sp_attack,
  sp_defense,
  speed,
  type1,
  type2,
  generation,
  is_legendary
FROM raw_pokemon
