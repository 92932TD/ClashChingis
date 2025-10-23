
draw_set_color(make_color_rgb(25, 25, 35));
draw_rectangle(0, 0, 960, 2040, false);


draw_set_font(fnt_elixir);
draw_set_color(c_white);
draw_text(960 / 2 - 140, 600, "Multiplayer Clash");



var hover_host = (mouse_x > button_host.x && mouse_x < button_host.x + button_host.w &&
                  mouse_y > button_host.y && mouse_y < button_host.y + button_host.h);

var hover_join = (mouse_x > button_join.x && mouse_x < button_join.x + button_join.w &&
                  mouse_y > button_join.y && mouse_y < button_join.y + button_join.h);

// Draw buttons
Script8(button_host, hover_host);
Script8(button_join, hover_join);
