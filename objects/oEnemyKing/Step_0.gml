x = stored_x
y = stored_y
if room = RoomPlayer1 {
if isActive {
if (hp <= 0) {
	global.redkingdead = true
    instance_destroy();
	
}
var nearest_id = noone
var dist = range
  with (BlueParent) {
	   

    if id != other.id && isRed != other.isRed {
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            other.target = id;
			
        }
    }
} 

if target != noone && instance_exists(target) {
	
    var dist = point_distance(x, y, target.x, target.y);
    if (dist <= range + target.sprite_height/2) {
        show_debug_message(string(current_time - last_shot_time) + " vs 48")
        if ((current_time - last_shot_time) > 48) && !cooldown {
            var p = instance_create_layer(x, y, "Instances", oArrow);
            p.direction = point_direction(x, y, target.x, target.y);
            p.spd = 8;
            p.dmg = dmg;
            p.target = target;
            last_shot_time = current_time
			alarm[0] = 48
			cooldown = true
			show_debug_message("Created Arrow")
        }
    }
} 

if (atk_interval > 0) atk_interval -= 1;
} else if global.redtowerslost > 0 or hp != max_hp {
	isActive = true
	image_index = 1;
}
} else {
	if isActive {
if (hp <= 0) {
	global.redkingdead = true
    instance_destroy();
}

 var nearest_id = noone
var dist = range
  with (BlueParent) {
	   

    if id != other.id && isRed != other.isRed {
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            other.target = id;
			
        }
    }
} 

if target != noone && instance_exists(target) {
	
    var dist = point_distance(x, y, target.x, target.y);
    if (dist <= range + target.sprite_height/2) {
        show_debug_message(string(current_time - last_shot_time) + " vs 48")
        if ((current_time - last_shot_time) > 48) && !cooldown {
            var p = instance_create_layer(x, y, "Instances", oArrow);
            p.direction = point_direction(x, y, target.x, target.y);
            p.spd = 8;
            p.dmg = dmg;
            p.target = target;
            last_shot_time = current_time
			alarm[0] = 48
			cooldown = true
			show_debug_message("Created Arrow")
        }
    }
} 

if (atk_interval > 0) atk_interval -= 1;

} else if global.redtowerslost > 0 or hp != max_hp {
	isActive = true
	image_index = 1;
}}

