istargetable = true
hp = 1907;
max_hp = hp;
dmg = 266;
atk_interval = 0
is_network_clone = false
base_atk = 90;
target = noone;
id_network = id
range = 90;
isBuilding = false
grid_size = 15;
spd = 2;
isRed = true
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

