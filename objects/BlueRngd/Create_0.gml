istargetable = true
hp = 304;
max_hp = hp;
dmg = 112;
atk_interval = 54
isBuilding = false
base_atk = 54;
is_network_clone = false
id_network = id
target = noone;
range = 300;
isRed = false
grid_size = 15;
spd = 2;
last_shot_time = 0
cooldown = false

path_grid = mp_grid_create(0, 0, room_width div grid_size, room_height div grid_size, grid_size, grid_size);
mp_grid_add_instances(path_grid, oBluePrincess, false);
mp_grid_add_instances(path_grid, oWater, false);
mp_grid_add_instances(path_grid, oWhite, false);
path1 = path_add()