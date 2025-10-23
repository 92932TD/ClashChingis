if global.bluekingdead {
instance_destroy()
}

x = stored_x
y = stored_y
if (hp <= 0) {
	
    instance_destroy();
}
timetogen -= 1
hp -= lifespan
log_message("lifespan: " + string(lifespan))
log_message("timetogen: " + string(timetogen))

if timetogen <= 0 && room != RoomPlayer2{
	global.elixir += 1
	timetogen = 720
}
/*
var nearest_id = noone;
    var dist = range;
	var nearesttarget = id
   with (RedParent) {
	   

    if id != other.id {
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            nearesttarget = id
			
        }
	}
    
} target = nearesttarget 
if target.id = id {
	target = noone
}
if target != noone && instance_exists(target) {
	
    var dist = point_distance(x, y, target.x, target.y);
    if (dist <= range + target.sprite_height/2) {
        
        if ((current_time - last_shot_time) > 48) && !cooldown {
			show_debug_message("Arrow created, with target: " + string(target.object_index) + string(target.id) + string(id))
            var p = instance_create_layer(x, y, "Instances", oBlueArrow);
            p.direction = point_direction(x, y, target.x, target.y);
            p.spd = 8;
            p.dmg = dmg;
            p.target = target;
			p.isfromtower = true
            last_shot_time = current_time
			alarm[0] = 48
			cooldown = true
			
        }
    }
} 

if (atk_interval > 0) atk_interval -= 1;

} else if room = RoomPlayer2{
	
	
if (hp <= 0) {
	global.bluetowerslost += 1
    instance_destroy();
}

 var nearest_id = noone;
    var dist = range;
   with (RedParent) {
	   

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
            var p = instance_create_layer(x, y, "Instances", oBlueArrow);
            p.direction = point_direction(x, y, target.x, target.y);
            p.spd = 8;
            p.dmg = dmg;
            p.target = target;
            last_shot_time = current_time
			alarm[0] = 48
			cooldown = true
			
        }
    }
} else if target == noone{
	
} 
}

