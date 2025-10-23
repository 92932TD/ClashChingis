x = stored_x
y = stored_y
if global.redkingdead {
	instance_destroy()
}
if room = RoomPlayer1 {

if (hp <= 0) {
	global.redtowerslost += 1
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
       
        if ((current_time - last_shot_time) > 48) && !cooldown {
            var p = instance_create_layer(x, y, "Instances", oArrow);
            p.direction = point_direction(x, y, target.x, target.y);
            p.spd = 8;
            p.dmg = dmg;
            p.target = target;
            last_shot_time = current_time
			alarm[0] = 48
			cooldown = true
		
        }
    }
} 

if (atk_interval > 0) atk_interval -= 1;

} else {
	
if (hp <= 0) {
	global.redtowerslost += 1
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
      
        if ((current_time - last_shot_time) > 48) && !cooldown {
            var p = instance_create_layer(x, y, "Instances", oArrow);
            p.direction = point_direction(x, y, target.x, target.y);
            p.spd = 8;
            p.dmg = dmg;
            p.target = target;
            last_shot_time = current_time
			alarm[0] = 48
			cooldown = true
			
        }
    }
} 

if (atk_interval > 0) atk_interval -= 1;
} 

