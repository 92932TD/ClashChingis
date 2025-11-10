
if hp <= 0 {
	instance_destroy();
}
if deploytime <= 0 {
if 1 = 1 {	
	var dist = 100000
	var nearesttarget = noone
with (RedParent) {
	
    if id != other.id && isRed != other.isRed && istargetable {
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            nearesttarget = id;
			
        }
    }
} target = nearesttarget 


}		

if (instance_exists(target)) {
    var dist = point_distance(x, y, target.x, target.y);
    if (dist > range) {
        mp_grid_path(path_grid, path1, x, y, target.x, target.y, true);
        path_start(path1, spd, path_action_stop, false);
    }
    if (dist <= range + target.sprite_height/2) {
        path_end();
        if current_time - last_shot_time > base_atk && !cooldown {
            var p = instance_create_layer(x, y, "Instances", oBlueArrow);
            p.direction = point_direction(x, y, target.x, target.y);
            p.spd = 8;
            p.dmg = dmg;
            p.target = target;
            atk_interval = base_atk;
			last_shot_time = current_time
			alarm[0] = base_atk
			cooldown = true
        }
    }
}

if (atk_interval > 0) atk_interval -= 1;

if (target != noone && (!instance_exists(target) || (variable_instance_exists(target, "hp") && target.hp <= 0))) {
    target = noone;
    path_end();
}
} else deploytime -= 1