istargetable = true
hp = 3760;
max_hp = hp;
dmg = 816;
atk_interval = 0
base_atk = 108;
is_network_clone = false
target = noone;
range = 57.6;
cooldown = false
last_shot_time = 0
isBuilding = false
id_network = id
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
mp_grid_add_instances(path_grid, oEnemyPrincess, false);
mp_grid_add_instances(path_grid, oWater, false);
mp_grid_add_instances(path_grid, oWhite, false);
path1 = path_add()