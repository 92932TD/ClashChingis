deploytime = 60
istargetable = true
hp = 1697;
max_hp = hp;
dmg = 317;
atk_interval = 0
base_atk = 96;
id_network = id
target = noone;
range = 48;
is_network_clone = false
isBuilding = false
grid_size = 15;

spd = 4;
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
last_shot_time = 0
cooldown = false