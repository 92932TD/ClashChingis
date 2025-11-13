if !is_network_clone {
    var dist_total = point_distance(start_x, start_y, target_x, target_y);
    var steps_total = 1 / spd; 
    var move_speed = dist_total / steps_total;

    var dir = point_direction(x, y, target_x, target_y);
    var dist = point_distance(x, y, target_x, target_y);

    if (dist > move_speed) {
        x += lengthdir_x(move_speed, dir);
        y += lengthdir_y(move_speed, dir);
    } else {
        x = target_x;
        y = target_y;

        with (RedParent) {
            if (point_distance(x, y, other.target_x, other.target_y) <= other.radius) {
                if isBuilding {
                    hp -= other.towerdamage;
                } else {
                    hp -= other.damage;
                }
            }
        }

        show_debug_message("Destroyed projectile");
        instance_destroy();
    }
}
