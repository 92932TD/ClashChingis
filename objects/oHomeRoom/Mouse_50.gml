

function point_in_button(_btn) {
    return (mouse_x > _btn.x && mouse_x < _btn.x + _btn.w &&
            mouse_y > _btn.y && mouse_y < _btn.y + _btn.h);
}

if (point_in_button(button_host)) {
    show_debug_message("HOST GAME clicked!");
    room_goto(RoomCardSelect); 
	global.isRed = false
}
else if (point_in_button(button_join)) {
    show_debug_message("JOIN GAME clicked!");
    room_goto(RoomCardSelect); 
	global.isRed = true
	
}
