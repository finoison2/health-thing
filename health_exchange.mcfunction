scoreboard objectives add finoison_target_health dummy
scoreboard objectives add finoison_average_health dummy
scoreboard objectives add finoison_owner_health dummy

# Get target entity's health (multiply by 2 to preserve .5 values)
execute store result score @s finoison_target_health run data get entity @s Health 2

# Get owner's health (the player with the tag)
execute as @a[tag=finoison_health_exchange_user,limit=1] store result score @s finoison_owner_health run data get entity @s Health 2

# Calculate average: add both healths together
scoreboard players operation @s finoison_average_health = @s finoison_target_health
scoreboard players operation @s finoison_average_health += @s finoison_owner_health

# Divide by 2 to get average (1.20.1 compatible)
scoreboard players operation @s finoison_average_health /= #2 finoison_target_health

# Store to global temp holder
scoreboard players operation #health_share finoison_average_health = @s finoison_average_health

# Apply averaged health to target (float 0.5 = divide by 2)
execute store result entity @s Health float 0.5 run scoreboard players get #health_share finoison_average_health

# Apply averaged health to owner
execute as @a[tag=finoison_health_exchange_user,limit=1] store result entity @s Health float 0.5 run scoreboard players get #health_share finoison_average_health
