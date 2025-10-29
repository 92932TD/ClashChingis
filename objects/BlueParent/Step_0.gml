if (hp <= 0) {
   

    instance_destroy();
}

	
if 1 = 1 {	
	var dist = 100000
	var nearesttarget = noone
with (RedParent) {
	
    if id != other.id && istargetable{
        var d = point_distance(x, y, other.x, other.y);
        if d < dist && d != 0 {
            dist = d;
            nearesttarget = id;
			
        }
    }
} target = nearesttarget 


}		

// act on target
if target != noone{
	
    var dist = point_distance(x,y,target.x,target.y);

    if (dist > range) {
	
        mp_grid_path(path_grid,path1,x,y,target.x,target.y,true);
        path_start(path1,spd,path_action_stop,false);
    }

    if (dist <= range + target.sprite_height/2) {
		
        path_end();
        if  !cooldown {
			
		
            

           
                target.hp -= dmg;
				
            

            atk_interval = base_atk;
			last_shot_time = current_time
			cooldown = true
			alarm[0] = atk_interval
        } 
			
		
    }
}

 atk_interval -= 1;

if (target != noone && (!instance_exists(target) || (variable_instance_exists(target,"hp") && target.hp <= 0))) {
    target = noone;
    path_end();
}
