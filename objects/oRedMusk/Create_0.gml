deploytime = 60
istargetable = true
hp = 721;
max_hp = hp;
dmg = 217;
atk_interval = 60
base_atk = 60;
target = noone;
range = 300;
isBuilding = false
is_network_clone = false
id_network = id
last_shot_time = 0
isRed = true
grid_size = 15;
spd = 2;
cooldown = false
last_shot_time = 0
path_grid = mp_grid_create(0, 0, room_width div grid_size, room_height div grid_size, grid_size, grid_size);
mp_grid_add_instances(path_grid, oEnemyPrincess, false);
mp_grid_add_instances(path_grid, oWater, false);
mp_grid_add_instances(path_grid, oWhite, false);
path1 = path_add()

