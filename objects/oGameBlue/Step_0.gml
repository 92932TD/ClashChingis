
if variable_global_exists("GAME_INSTANCE_ID") {

if global.GAME_INSTANCE_ID = 0 {
	
    
   

    
}



 if global.GAME_INSTANCE_ID = 1 {
	alarm[1] = 1
	
	
	
} 
}
 
elixirgeneration -= 1;
if (elixirgeneration <= 0) {
    if (global.elixir < 10) {
        global.elixir += 1;
    } else {
        // show_debug_message("leaking elixir");
    }
    elixirgeneration = 168;
}

var card_size = 90;
var spacing = 20;
var num_cards = array_length(hand);
var total_width = num_cards * card_size + (num_cards - 1) * spacing;
var start_x = (display_get_gui_width() - total_width) / 2;
var card_y = display_get_gui_height() - 100;

for (var i = 0; i < 4; i++) {
    var card = hand[i]; 
	
    var card_x = start_x + i * (card_size + spacing);

   
    draw_sprite(card.sprite, 0, card_x, card_y);

   
    if (mouse_check_button_pressed(mb_left)) {
        if (mouse_x >= card_x - card_size / 2 && mouse_x <= card_x + card_size / 2 &&
    mouse_y >= card_y - card_size / 2 && mouse_y <= card_y + card_size / 2)
 {
cardsomething = card;
            if (global.elixir >= card.cost) {
                selected_card = i; 
                show_debug_message("Selected card index in hand: " + string(selected_card)
                    + " (" + object_get_name(hand[i].obj) + ")");
            }
        }
    }
}
