istargetable = true
hp = 3993;
max_hp = hp;
id_network = id
dmg = 268;
jump_dmg = 537
spawndmg = 430
atk_interval = 102
cooldown = false
last_shot_time = 0
is_network_clone = false
cooldown = false
base_atk = 102;
target = noone;
range = 78;
isBuilding = false;
isRed = true
grid_size = 15;
spd = 2;
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
jump_cooldown_timer = 0;
jump_cooldown_time = 240;
is_jumping = false;
jump_progress = 0;
jump_duration = 36;
jump_height = 120;
start_x = x;
start_y = y;
end_x = x;
end_y = y;
landing_x = x;
landing_y = y;
landing_radius = 120;



with (BlueParent) {
	var spawn_radius = 120;
 var spawn_damage = 598;
	var knockback = 12
    var d = point_distance(x, y, other.x, other.y);
    if (d <= spawn_radius) {
        if (variable_instance_exists(id, "hp")) {
            hp -= spawn_damage;
        }
        var nx = other.x - x;
        var ny = other.y - y;
        var distk = point_distance(other.x, other.y, x, y);
        if (distk == 0) { nx = 0; ny = -1; distk = 1; }
        var k = (spawn_radius - d) / spawn_radius;
        x += (nx / distk) * (knockback * k);
        y += (ny / distk) * (knockback * k);
    }
}