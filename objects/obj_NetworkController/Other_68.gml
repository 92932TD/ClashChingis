
var type = async_load[? "type"];

switch (type) {

    case network_type_connect:

        global.Client_Socket = async_load[? "socket"];

    break;

    case network_type_disconnect:
     

        global.Client_Socket = -1;
    break;

    case network_type_data:
      
        var buffer_in = async_load[? "buffer"];
       
    break;
}


var type1 = ds_map_find_value(async_load, "type");

if (type1 == network_type_data) {
	
    var buffer_in = ds_map_find_value(async_load, "buffer");

    if (buffer_exists(buffer_in)) {
		
        buffer_seek(buffer_in, buffer_seek_start, 0);

        var command = buffer_read(buffer_in, buffer_u8);

        if (command == 100) { 
            var net_id = buffer_read(buffer_in, buffer_s32); 
            var new_x = buffer_read(buffer_in, buffer_s32);
            var new_y = buffer_read(buffer_in, buffer_s32);
            var obj_type = buffer_read(buffer_in, buffer_s32);
			var new_hp = buffer_read(buffer_in, buffer_s32);
		    var new_max_hp = buffer_read(buffer_in, buffer_s32);
		    var new_dmg  = buffer_read(buffer_in, buffer_s32);
            var new_atk_interval = buffer_read(buffer_in, buffer_s32);
            var new_base_atk = buffer_read(buffer_in, buffer_s32);
            var new_range = buffer_read(buffer_in, buffer_s32);
			var new_isBuilding = buffer_read(buffer_in, buffer_u8);
			var new_isRed = buffer_read(buffer_in, buffer_u8);
			
			var reflected_y = room_height -240 - new_y
     
            var remote = noone;
            var count = instance_number(all);
            for (var i = 0; i < count; i++) {
                var inst = instance_find(all, i);
                if (variable_instance_exists(inst, "id_network") && inst.id_network == net_id) {
                    remote = inst;
                    break; 
                }
            }

     
            if (!instance_exists(remote)) {
                remote = instance_create_layer(new_x, reflected_y,"Instances_Cards", obj_type); 
                remote.id_network = net_id;
				remote.is_network_clone = false
               
            }

     
            remote.x = new_x;
            remote.y = reflected_y;
			remote.hp           = new_hp;
			
			remote.dmg          = new_dmg;
			remote.atk_interval = new_atk_interval;
			remote.base_atk     = new_base_atk;
			remote.range        = new_range;
			remote.isBuilding   = new_isBuilding;
			remote.isRed        = new_isRed;
    
             
        }
		var type = ds_map_find_value(async_load, "type");
if (type == network_type_data) {
    var buffer_in = ds_map_find_value(async_load, "buffer");
    buffer_seek(buffer_in, buffer_seek_start, 0);
    var command = buffer_read(buffer_in, buffer_u8);

    if (command == 200) { 
        var net_id = buffer_read(buffer_in, buffer_s32);

        
        var inst = noone;
        var count = instance_number(all);
        for (var i = 0; i < count; i++) {
            var tmp = instance_find(all, i);
            if (variable_instance_exists(tmp, "id_network") && tmp.id_network == net_id) {
                inst = tmp;
                break;
            }
        }

       
        if (instance_exists(inst)) {
            with (inst) instance_destroy();
        }
    }
	if (command == 150) {
		show_debug_message("Recieved spell instructions")
    var xx = buffer_read(buffer_in, buffer_f32);
    var yy = buffer_read(buffer_in, buffer_f32);
    var radius = buffer_read(buffer_in, buffer_f32);
    var damage = buffer_read(buffer_in, buffer_s32);
    var towerdamage = buffer_read(buffer_in, buffer_s32);
	var spd = buffer_read(buffer_in, buffer_f32);
show_debug_message("SPD of buffer: " + string(spd))
    var reflected_yy = room_height - 240 - yy;

     var proj = instance_create_layer(480, 1620, "Instances", oRedProjectile);
    proj.start_x = 480
    proj.start_y = 150;
    proj.target_x = xx
	proj.spd = spd
    proj.target_y = reflected_yy
    proj.radius = radius;
    proj.damage = damage;
    proj.towerdamage = towerdamage;
	if radius = 150 { 
		proj.sprite_index = sFireball
	} else if radius = 210 {
		proj.sprite_index = sBlueArrowInHand
	}
}

}


    } 
}
