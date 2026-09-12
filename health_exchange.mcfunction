scoreboard objectives add finoison_target_health dummy
scoreboard objectives add finoison_average_health dummy
scoreboard objectives add finoison_owner_health dummy
execute store result score @s finoison_target_health run data get entity @s Health 100
execute as @a[tag=finoison_health_exchange_user,limit=1] store result score @s finoison_owner_health run data get entity @s Health 100
scoreboard players operation @s finoison_average_health = @s finoison_target_health
scoreboard players operation @s finoison_average_health += @a[tag=finoison_health_exchange_user,limit=1] finoison_owner_health
scoreboard players set @s finoison_target_health 2
scoreboard players operation @s finoison_average_health /= @s finoison_target_health
execute store result entity @s Health float 0.01 run scoreboard players get @s finoison_average_health
scoreboard players operation #finoison_shared_health finoison_average_health = @s finoison_average_health
execute as @a[tag=finoison_health_exchange_user,limit=1] store result entity @s Health float 0.01 run scoreboard players get #finoison_shared_health finoison_average_health