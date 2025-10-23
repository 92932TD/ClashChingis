if !audio_is_playing(global.current_song) {
		play_next_song()
}
if room = RoomCardSelect {
// select card logic
for (var i = 0; i < array_length(global.cards_all); i++) {
    var row = i div cols;
    var col = i mod cols;
    var xx = 150 + col * (size + pad);
    var yy = 100 + row * (size + pad) + scroll_offset;

    var half = size / 2;

if (mouse_check_button_pressed(mb_left) &&
    point_in_rectangle(mouse_x, mouse_y, xx - half, yy - half, xx + half, yy + half))
{

    {
        if (ds_list_find_index(selected_deck, i) == -1) {
            if (ds_list_size(selected_deck) < 8) {
                ds_list_add(selected_deck, i);
				show_debug_message("Added Card: " + string(ds_list_size(selected_deck)))
            }
        } else {
            ds_list_delete(selected_deck, ds_list_find_index(selected_deck, i));
        }
    }
}
}
// Only allow confirm when 8 selected
if (ds_list_size(selected_deck) == 8) {
	global.selected_deck = selected_deck
	if global.isRed {
    room_goto(RoomJoin)
	
	} else if !global.isRed {
		room_goto(RoomHost)
		
	}
	
	
	
}
}

   