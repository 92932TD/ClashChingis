
if (hp <= 0) {
    instance_destroy();
}
if 1 = 1 {	
	var dist = 100000
	var nearesttarget = noone
with (BlueParent) {
	
    if id != other.id && isRed != other.isRed && istargetable {
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            nearesttarget = id;
			show_debug_message("discovered a target: " + string(id))
        }
    }
} target = nearesttarget 
show_debug_message("Target: " + (target == noone ? "NOONE (No enemies found)" : "Found Target ID: " + string(target.id)));

}		

if (instance_exists(target)) {
    var dist = point_distance(x, y, target.x, target.y);

    if (dist > range) {
        
		

 

        mp_grid_path(path_grid, path1, x, y, target.x, target.y, true);
        path_start(path1, spd, path_action_stop, false);

        
    }

    if (dist <= range + target.sprite_height/4) {
        path_end();
        if (atk_interval <= 0)  {
           with (BlueParent) {
    
        if (point_distance(other.x, other.y, x, y) <= 180) && id != other.id {
            hp -= other.dmg; 
			
        }
    }

   atk_interval = 90     } 
    }
}

if (atk_interval > 0) atk_interval -= 1;

if (target != noone && (!instance_exists(target) || (variable_instance_exists(target, "hp") && target.hp <= 0))) {
    target = noone;
    path_end();
}


