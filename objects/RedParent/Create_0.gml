istargetable = true
hp = 1766;
max_hp = hp;
dmg = 202;
atk_interval = 0
base_atk = 72;
cooldown = 0
last_shot_time = 0
target = noone;
is_network_clone = false
range = 48;
isBuilding = false;
isRed = true
id_network = id
grid_size = 15;
deploytime = 60
spd = 2;
path_grid = mp_grid_create(
    0,
    0,
    room_width div grid_size,
    room_height div grid_size,
    grid_size,
    grid_size
);

mp_grid_add_instances(path_grid, oWater, false);
mp_grid_add_instances(path_grid, oWhite, false);
mp_grid_add_instances(path_grid, oEnemyPrincess, false);
path1 = path_add()
last_shot_time = 0
cooldown = false