
// --- Async Networking Event ---
var type = ds_map_find_value(async_load, "type");

if (type == network_type_data) {
	
    var buffer_in = ds_map_find_value(async_load, "buffer");

    if (buffer_exists(buffer_in)) {
		
        buffer_seek(buffer_in, buffer_seek_start, 0);

        var command = buffer_read(buffer_in, buffer_u8);

        if (command == 100) { // position packet
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
            // --- Inline logging function ---
            if (!global.debug_lines) global.debug_lines = ds_list_create();
            var log = function(msg) {
                ds_list_add(global.debug_lines, msg);
                // Keep only last 10 messages
                 while (ds_list_size(global.debug_lines) > 10) {
        ds_list_delete(global.debug_lines, 0);
    }
            }

            // Find existing instance by network ID
            var remote = noone;
            var count = instance_number(all);
            for (var i = 0; i < count; i++) {
                var inst = instance_find(all, i);
                if (variable_instance_exists(inst, "id_network") && inst.id_network == net_id) {
                    remote = inst;
                    break; // stop when found
                }
            }

            // Create if it doesn’t exist
            if (!instance_exists(remote)) {
				
			var layer_name = new_isBuilding ? "Instances" : "Instances_Cards";


			remote = instance_create_layer(new_x, reflected_y, layer_name, obj_type);
			remote.id_network = net_id;

				remote.is_network_clone = true
                
            }

            // Update position
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
		if (command == 200) { // destroy packet
    var net_id = buffer_read(buffer_in, buffer_s32);

    // Find instance with this network id
    var target = noone;
    with (all) {
        if (variable_instance_exists(id, "id_network") && id_network == net_id) target = id;
    }

    // Destroy if found
    if (instance_exists(target)) {
        with (target) instance_destroy();
        
    }
}
if (command == 670) {
    var proj_id = buffer_read(buffer_in, buffer_s32);
    var px = buffer_read(buffer_in, buffer_s32);
    var py = buffer_read(buffer_in, buffer_s32);
    var target_id = buffer_read(buffer_in, buffer_s32);
    var dmg = buffer_read(buffer_in, buffer_s32);
    var owner_isRed = buffer_read(buffer_in, buffer_u8);
var reflected_py = room_height -240 - new_y 
    // Find existing projectile instance
    var proj_inst = noone;
    var count = instance_number(oProjectile);
    for (var i = 0; i < count; i++) {
        var inst = instance_find(oProjectile, i);
        if (variable_instance_exists(inst, "id_network") && inst.id_network == proj_id) {
            proj_inst = inst;
            break;
        }
    }

   
    if (!instance_exists(proj_inst)) {
        proj_inst = instance_create_layer(px, py, "Instances", oProjectile);
        proj_inst.id_network = proj_id;
        proj_inst.is_network_clone = true;
    }

  
    proj_inst.x = px;
    proj_inst.y = reflected_py;
    proj_inst.target_id = target_id;
    
}

 
    } 
}