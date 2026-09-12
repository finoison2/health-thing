scoreboard objectives add finoison_target_health dummy
scoreboard objectives add finoison_average_health dummy
scoreboard objectives add finoison_owner_health dummy

# Store target's health
execute store result score @s finoison_target_health run data get entity @s Health 2

# Store player's health (player has the tag)
execute as @a[tag=finoison_health_exchange_user,limit=1] store result score @a[tag=finoison_health_exchange_user,limit=1] finoison_owner_health run data get entity @s Health 2

# Calculate average on player's score
scoreboard players operation @a[tag=finoison_health_exchange_user,limit=1] finoison_average_health = @s finoison_target_health
scoreboard players operation @a[tag=finoison_health_exchange_user,limit=1] finoison_average_health += @a[tag=finoison_health_exchange_user,limit=1] finoison_owner_health
scoreboard players operation @a[tag=finoison_health_exchange_user,limit=1] finoison_average_health /= #2 finoison_target_health

# Apply to target
execute store result entity @s Health float 0.5 run scoreboard players get @a[tag=finoison_health_exchange_user,limit=1] finoison_average_health

# Apply to player
execute as @a[tag=finoison_health_exchange_user,limit=1] store result entity @s Health float 0.5 run scoreboard players get @s finoison_average_health
