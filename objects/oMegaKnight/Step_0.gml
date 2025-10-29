if (hp <= 0) {
    show_debug_message("Destroyed: HP <= 0");
    instance_destroy();
}

if (jump_cooldown_timer > 0) jump_cooldown_timer -= 1;

var dist = 100000;
var nearesttarget = noone;

with (RedParent)  {
    if id != other.id && istargetable {
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            nearesttarget = id;
        }
    }
}
target = nearesttarget;

if is_jumping && !is_network_clone {
    show_debug_message("Jumping... progress = " + string(jump_progress));

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
        show_debug_message("Landed from jump");
        x = landing_x;
        y = landing_y;
        is_jumping = false;
        jump_progress = 0;
        jump_cooldown_timer = jump_cooldown_time;
        mp_grid_path(path_grid, path1, x, y, x, y, true);
        path_end();

        with (RedParent) {
            knockback = 12;
            var dd = point_distance(x, y, other.landing_x, other.landing_y);
            if (dd <= other.landing_radius) && !isBuilding {
                if (variable_instance_exists(id, "hp")) {
                    hp -= other.jump_dmg;
                    show_debug_message("Jump damage applied: -" + string(other.jump_dmg));
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
                x += (nx / distk) * (other.knockback * k);
                y += (ny / distk) * (other.knockback * k);
                show_debug_message("Knockback applied to RedParent");
            }
        }
    }

    if (target != noone && (!instance_exists(target) || (variable_instance_exists(target, "hp") && target.hp <= 0))) {
        show_debug_message("Target lost during jump");
        target = noone;
        path_end();
    }

    atk_interval -= 1;
    if (atk_interval < 0) atk_interval = 0;

    exit;
}

if target != noone {
    var distt = point_distance(x, y, target.x, target.y);
    show_debug_message("Target found, distance = " + string(distt));

    if (distt > range) {
        if (!is_jumping) {
            show_debug_message("Moving toward target");
            mp_grid_path(path_grid, path1, x, y, target.x, target.y, true);
            path_start(path1, spd, path_action_stop, false);
        }
    }

    if (distt > range && distt >= 210 && distt <= 300 && jump_cooldown_timer <= 0) {
        show_debug_message("Initiating jump attack");
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
    }

    if (distt <= range + target.sprite_height / 2) {
        path_end();
        if (!cooldown) {
            show_debug_message("Attacking target");

            var unit = id;
            var dir_to_target = point_direction(unit.x, unit.y, target.x, target.y);

            with (RedParent) if (id != unit) {
                var dir_to_me = point_direction(unit.x, unit.y, x, y);
                var angle_diff = angle_difference(dir_to_target, dir_to_me);
                if (abs(angle_diff) <= 60) {
                    show_debug_message("Target within 60° arc, attack confirmed");
                }
            }

            atk_interval = base_atk;
            last_shot_time = current_time;
            cooldown = true;
            alarm[0] = atk_interval;
        } else {
            show_debug_message("Attack on cooldown");
        }
    }
} else {
    show_debug_message("No target");
}

atk_interval -= 1;
if (atk_interval < 0) atk_interval = 0;

if (target != noone && (!instance_exists(target) || (variable_instance_exists(target, "hp") && target.hp <= 0))) {
    show_debug_message("Target removed (dead or destroyed)");
    target = noone;
    path_end();
}
