
draw_self();


var bar_width = sprite_width; 
var bar_height = 20;           
var bar_x1 = x - 45
var bar_y1 = y - sprite_height/2 - 30; 
var bar_x2 = x;
var bar_y2 = bar_y1 + bar_height;

draw_set_alpha(0.8)
var hp_ratio = hp / max_hp
draw_set_colour(c_green)
draw_rectangle(bar_x1, bar_y1, bar_x1 + bar_width, bar_y2, false)
draw_set_alpha(0.8)
draw_set_colour(c_red)
draw_rectangle(bar_x1, bar_y1, bar_x1 + bar_width * hp_ratio, bar_y2, false)
draw_set_colour(c_white)
draw_set_alpha(1)



if deploytime > 0 {
draw_set_alpha(0.8)

draw_set_colour(c_green)
draw_circle(x, y, sprite_width / 2, false)

draw_set_colour(c_red)
draw_circle(x, y, (deploytime / sprite_width) * (sprite_width / 2), false)
draw_set_colour(c_white)
draw_set_alpha(1)
}
