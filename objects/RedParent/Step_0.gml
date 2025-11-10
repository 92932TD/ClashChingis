if (hp <= 0) {
     
        var buffer_out = buffer_create(64, buffer_fixed, 1);
        buffer_write(buffer_out, buffer_u8, 200); 
        buffer_write(buffer_out, buffer_s32, id_network);

        if (global.Client_Socket != -1) {
            network_send_packet(global.Client_Socket, buffer_out, buffer_tell(buffer_out));
        }

        buffer_delete(buffer_out);
    

    instance_destroy();
}

if deploytime <= 0 {

if 1 = 1 {	
	var dist = 100000
	var nearesttarget = noone
with (BlueParent) {
	
    if id != other.id && isRed != other.isRed && istargetable {
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            nearesttarget = id;
			
        }
    }
} target = nearesttarget 


}		
	
	
// act on target
if (instance_exists(target)) {
    var dist = point_distance(x,y,target.x,target.y);

    if (dist > range) {
        mp_grid_path(path_grid,path1,x,y,target.x,target.y,true);
        path_start(path1,spd,path_action_stop,false);
    }

    if (dist <= range + target.sprite_height/2) {
        path_end();
        if (current_time - last_shot_time > base_atk) && !cooldown {
            

            if (variable_instance_exists(target,"hp")) {
                target.hp -= dmg;
            }

            atk_interval = base_atk;
			last_shot_time = current_time
			cooldown = true
			alarm[0] = base_atk
        }
    }
} 
if (atk_interval > 0) atk_interval -= 1;

if (target != noone && (!instance_exists(target) || (variable_instance_exists(target,"hp") && target.hp <= 0))) {
    target = noone;
    path_end();
}
} else deploytime -= 1 