scoreboard objectives add finoison_target_health dummy
scoreboard objectives add finoison_average_health dummy
scoreboard objectives add finoison_owner_health dummy

# Store target entity's health (multiply by 2 to preserve decimals)
execute store result score #target_health finoison_target_health run data get entity @s Health 2

# Store player's health 
execute as @a[tag=finoison_health_exchange_user,limit=1] store result score #player_health finoison_owner_health run data get entity @s Health 2

# Calculate average: target + player
scoreboard players operation #average finoison_average_health = #target_health finoison_target_health
scoreboard players operation #average finoison_average_health += #player_health finoison_owner_health

# Divide by 2
scoreboard players operation #average finoison_average_health /= #2 finoison_target_health

# Apply averaged health to target entity
execute store result entity @s Health float 0.5 run scoreboard players get #average finoison_average_health

# Apply averaged health to player
execute as @a[tag=finoison_health_exchange_user,limit=1] store result entity @s Health float 0.5 run scoreboard players get #average finoison_average_health
