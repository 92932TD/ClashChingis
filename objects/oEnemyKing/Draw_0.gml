
draw_self();


var bar_width = 120; 
var bar_height = 20;           
var bar_x1 = x - 60
var bar_y1 = y - sprite_height/2 - 10; 
var bar_x2 = x + 60
var bar_y2 = bar_y1 + bar_height;
draw_set_alpha(0.8)
var hp_ratio = hp / max_hp
draw_set_colour(c_green)
draw_rectangle(bar_x1, bar_y1, bar_x2, bar_y2, false)
draw_set_alpha(0.8)
draw_set_colour(c_red)
draw_rectangle(bar_x1, bar_y1, bar_x1 + bar_width * hp_ratio, bar_y2, false)
draw_set_colour(c_white)
draw_set_alpha(1)
draw_set_font(fnt_hp)
draw_text(bar_x1 + 30, bar_y1, hp )