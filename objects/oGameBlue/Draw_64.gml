  var bar_width = 900
var bar_height = 35
var bar_x1 = (display_get_gui_width() - bar_width) / 2
var bar_y1 = display_get_gui_height() - 40
var bar_x2 = bar_x1 + bar_width
var bar_y2 = bar_y1 + bar_height
var ratio = global.elixir/maxElixir
draw_set_alpha(0.8)
draw_set_colour(c_dkgrey)
draw_rectangle(bar_x1, bar_y1, bar_x2, bar_y2, false);

draw_set_color(c_purple);
draw_rectangle(bar_x1, bar_y1, bar_x1 + bar_width * ratio, bar_y2, false);
draw_set_font(fnt_elixir)
draw_set_color(c_black);
var text_str = string(floor(global.elixir)) + " / " + string(maxElixir);
draw_text(20, display_get_gui_height() - 90, text_str);


draw_set_alpha(1);
var segments = maxElixir;
for (var i = 1; i < segments; i++) {
    var ridge_x = bar_x1 + (bar_width / segments) * i;
    draw_line(ridge_x, bar_y1, ridge_x, bar_y2);
}

for (var i = 0; i < array_length(hand); i++) {
    var card = hand[i];
    var card_x = 300 + i * 110;
    var card_y = display_get_gui_height() - 100;

    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_sprite(card.sprite, 0, card_x, card_y);

   
    if (global.elixir < card.cost) {
        draw_set_alpha(0.5);
        draw_rectangle(card_x-50, card_y-70, card_x+50, card_y+70, true);
        draw_set_alpha(1);
    }

    draw_set_color(c_black);
    draw_text(card_x - 10, card_y - 100, string(card.cost));
}

if (array_length(cards_available) > 0) {
    var next_card = cards_available[array_length(cards_available) - 1];

    var nx = 300 + 5 * 110;
    var ny = display_get_gui_height() - 100;

    
    draw_set_alpha(0.2);
    draw_sprite(next_card.sprite, 0, nx, ny);
    draw_set_alpha(1);

    draw_set_color(c_black);
    draw_text(nx - 10, ny - 100, string(next_card.cost));
}

if (selected_card != -1 && cardsomething.type = "spell") {
    draw_set_alpha(0.4);
    draw_set_color(c_blue);
	if cardsomething.obj = oBlueArrow or cardsomething.obj = oArrow {
    draw_circle(mouse_x, mouse_y, 210, false);
	} else if cardsomething.obj = oFireball {
		draw_circle(mouse_x, mouse_y, 150, false);
	} else if cardsomething.obj = oRocket {
		draw_circle(mouse_x, mouse_y, rocketradius, false);
	}
	
    draw_set_alpha(1);
} else if selected_card != -1{
	
	draw_set_color(c_red)
	draw_set_alpha(0.4)
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height() / 2 - 120, false);


	draw_set_alpha(0.4);
	draw_sprite(cardsomething.sprite, 0, mouse_x, mouse_y)
	draw_set_alpha(1)
}