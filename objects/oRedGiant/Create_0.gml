deploytime = 60
istargetable = true
hp = 4090;
max_hp = hp;
dmg = 253;
atk_interval = 0
base_atk = 90;
id_network = id
target = noone;
is_network_clone = false
range = 72;
isBuilding = false
grid_size = 15;
spd = 1.5;
isRed = true
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
last_shot_time = 0
cooldown = false