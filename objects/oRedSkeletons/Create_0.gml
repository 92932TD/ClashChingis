istargetable = true
hp = 81;
max_hp = hp;
id_network = id
dmg = 81;
atk_interval = 66
cooldown = false
last_shot_time = 0
is_network_clone = false
cooldown = false
base_atk = 66;
target = noone;
range = 30;
isBuilding = false;
isRed = true
grid_size = 15;
spd = 3;
path_grid = mp_grid_create(
    0,
    0,
    room_width div grid_size,
    room_height div grid_size,
    grid_size,
    grid_size
);
mp_grid_add_instances(path_grid, oEnemyPrincess, false);
mp_grid_add_instances(path_grid, oWater, false);
mp_grid_add_instances(path_grid, oWhite, false);
path1 = path_add()

