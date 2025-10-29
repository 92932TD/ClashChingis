if (hp <= 0) {
    instance_destroy();
    exit;
}
if (jump_cooldown_timer > 0) jump_cooldown_timer -= 1;
var dist = 100000;
var nearesttarget = noone;
with (BlueParent) {
    if id != other.id && istargetable{
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            nearesttarget = id;
        }
    }
}
target = nearesttarget;
if is_jumping && !is_network_clone {
    jump_progress += 1;
    var t = jump_progress / jump_duration;
    if (t > 1) t = 1;
    x = lerp(start_x, end_x, t);
    y = lerp(start_y, end_y, t) - (4 * t * (1 - t) * jump_height);
    if (instance_exists(target)) {
        end_x = target.x;
        end_y = target.y;
        landing_x = end_x;
        landing_y = end_y;
    }
    if (jump_progress >= jump_duration) {
        x = landing_x;
        y = landing_y;
        is_jumping = false;
        jump_progress = 0;
        jump_cooldown_timer = jump_cooldown_time;
        mp_grid_path(path_grid, path1, x, y, x, y, true);
        path_end();
        with (RedParent) {
			var knockback = 12
            var dd = point_distance(x, y, other.landing_x, other.landing_y);
            if (dd <= other.landing_radius) {
                if (variable_instance_exists(id, "hp")) {
                    hp -= other.jump_dmg;
                }
                var nx = x - other.landing_x;
                var ny = y - other.landing_y;
                var distk = point_distance(x, y, other.landing_x, other.landing_y);
                if (distk == 0) {
                    nx = 0;
                    ny = -1;
                    distk = 1;
                }
                var k = (other.landing_radius - dd) / other.landing_radius;
                x += (nx / distk) * (knockback * k);
                y += (ny / distk) * (knockback * k);
            }
        }
    }
    if (target != noone && (!instance_exists(target) || (variable_instance_exists(target, "hp") && target.hp <= 0))) {
        target = noone;
        path_end();
    }
    atk_interval -= 1;
    if (atk_interval < 0) atk_interval = 0;
    exit;
}
if target != noone {
    var distt = point_distance(x, y, target.x, target.y);
    if (distt > range) {
        if (!is_jumping) {
            mp_grid_path(path_grid, path1, x, y, target.x, target.y, true);
            path_start(path1, spd, path_action_stop, false);
        }
    }
    if (distt > range && distt >= 210 && distt <= 300 && jump_cooldown_timer <= 0) {
        is_jumping = true;
        jump_progress = 0;
        start_x = x;
        start_y = y;
        end_x = target.x;
        end_y = target.y;
        landing_x = end_x;
        landing_y = end_y;
        jump_duration = 36;
        jump_height = 120;
        path_end();
        exit;
    }
    if (distt <= range + target.sprite_height / 2) {
        path_end();
        if (!cooldown) {
            target.hp -= dmg;
            atk_interval = base_atk;
            last_shot_time = current_time;
            cooldown = true;
            alarm[0] = atk_interval;
        }
    }
}
atk_interval -= 1;
if (atk_interval < 0) atk_interval = 0;
if (target != noone && (!instance_exists(target) || (variable_instance_exists(target, "hp") && target.hp <= 0))) {
    target = noone;
    path_end();
}
