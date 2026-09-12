scoreboard objectives add finoison_target_health dummy
scoreboard objectives add finoison_average_health dummy
scoreboard objectives add finoison_owner_health dummy
scoreboard objectives add finoison_divisor dummy

# Get target entity's health (stored as integer, multiply by 2 to preserve .5 values)
execute store result score @s finoison_target_health run data get entity @s Health 2

# Get owner's health (the player with the tag)
execute as @a[tag=finoison_health_exchange_user,limit=1] store result score @s finoison_owner_health run data get entity @s Health 2

# Add both healths together
scoreboard players operation @s finoison_average_health = @s finoison_target_health
scoreboard players operation @s finoison_average_health += @a[tag=finoison_health_exchange_user,limit=1] finoison_owner_health

# Divide by 2 to get average
scoreboard players set @s finoison_divisor 2
scoreboard players operation @s finoison_average_health /= @s finoison_divisor

# Apply the average health to both entities (convert back by dividing by 2)
execute store result entity @s Health float 0.5 run scoreboard players get @s finoison_average_health
execute as @a[tag=finoison_health_exchange_user,limit=1] store result entity @s Health float 0.5 run scoreboard players get @s finoison_average_health
