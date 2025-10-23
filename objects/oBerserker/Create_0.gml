
grid_size = 15
hp = 896;
max_hp = hp;
dmg = 102;
id_network = id
atk_interval = 0
cooldown = false
last_shot_time = 0
is_network_clone = false
base_atk = 30;
target = noone;
range = 48;
spd = 3;
isBuilding = false
isRed = false
path_grid = mp_grid_create(
    0,
    0,
    room_width div grid_size,
    room_height div grid_size,
    grid_size,
    grid_size
);
mp_grid_add_instances(path_grid, oBluePrincess, false);
mp_grid_add_instances(path_grid, oWater, false);
mp_grid_add_instances(path_grid, oWhite, false);
path1 = path_add()

