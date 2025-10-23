function Script8(){

var btn = argument0;
var hover = argument1;

var color = hover ? c_yellow : c_dkgray;
draw_set_color(color);
draw_roundrect(btn.x, btn.y, btn.x + btn.w, btn.y + btn.h, 24);

draw_set_color(c_white);
draw_text(btn.x + (btn.w / 2) - string_width(btn.text) / 2,
          btn.y + (btn.h / 2) - string_height(btn.text) / 2,
          btn.text);

}