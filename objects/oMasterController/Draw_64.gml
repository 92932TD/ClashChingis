if room = RoomCardSelect {
	
draw_set_color(make_color_rgb(25, 25, 35));
draw_rectangle(0, 0, 960, 2040, false);

	var cols = 5;
var size = 100;
var pad = 20;

for (var i = 0; i < array_length(global.cards_all); i++) {
    var row = i div cols;
    var col = i mod cols;
    var xx = 150 + col * (size + pad);
    var yy = 100 + row * (size + pad) + scroll_offset;
    var card = global.cards_all[i];

    draw_sprite(card.sprite, 0, xx, yy);

    var half = size * 0.5;

if (ds_list_find_index(selected_deck, i) != -1) {
    draw_set_alpha(0.5);
    draw_rectangle(xx - half, yy - half, xx + half, yy + half, false);
    draw_set_alpha(1);
}

}
draw_text(20, 20, "Deck: " + string(ds_list_size(selected_deck)) + "/8");
}