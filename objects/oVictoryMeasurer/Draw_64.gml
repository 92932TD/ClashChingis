if global.redkingdead or global.bluekingdead {
	draw_set_alpha(0.75);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

  
    var cx = display_get_gui_width() / 2;
    var cy = display_get_gui_height() / 4;
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_set_font(fnt_elixir); 
    
    draw_text(cx, cy, "sigma!");


    draw_set_font(fnt_elixir); 
    draw_set_color(c_aqua);
    draw_text(cx, cy + 100, "Twin Towers Destroyed: " + string(global.bluetowerslost));

    draw_set_color(c_red);
    draw_text(cx, cy + 160, "Twin Towers Destroyed: " + string(global.redtowerslost));

    
    draw_set_color(c_yellow);
	if global.victor = 0 {
    draw_text(cx, cy + 240, "Winner: 41" );
	} else if global.victor = 1 {
		draw_text(cx, cy + 240, "Winner: 67" );
	}

   
    draw_set_font(fnt_elixir);
    draw_set_color(c_white);
    draw_text(cx, cy + 320, "Press67 it the game");
}