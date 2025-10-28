hp = 12000;
max_hp = hp;
id_network = id
dmg = 6000;
atk_interval = 1
cooldown = false
last_shot_time = 0
is_network_clone = false
cooldown = false
base_atk = 1;
target = noone;
range = 670;
isBuilding = false;
isRed = false
grid_size = 15;
spd = 20;
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

