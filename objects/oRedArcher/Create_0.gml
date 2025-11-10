istargetable = true
hp = 304;
max_hp = hp;
is_network_clone = false
dmg = 112;
atk_interval = 54
deploytime = 60
base_atk = 54;
target = noone;
id_network = id
range = 300;
isBuilding = false
isRed = true
grid_size = 15;
spd = 2;
isRed = true
last_shot_time = 0
cooldown = false
last_shot_time = 0

path_grid = mp_grid_create(0, 0, room_width div grid_size, room_height div grid_size, grid_size, grid_size);
mp_grid_add_instances(path_grid, oWater, false);
mp_grid_add_instances(path_grid, oWhite, false);
mp_grid_add_instances(path_grid, oEnemyPrincess, false);
path1 = path_add()