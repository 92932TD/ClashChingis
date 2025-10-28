if (selected_card != -1) {
    var card_data = hand[selected_card];

    // --- Troop placement ---
    if (mouse_y > 990 && mouse_y < 1800 && card_data.type != "spell" && !position_meeting(mouse_x, mouse_y, oBluePrincess)) {
        var num = card_data.num;
        var radius = 50;

        for (var i = 0; i < num; i++) {
            var angle = i * (360 / num);
            var rad = degtorad(angle);
            var x_pos = mouse_x + cos(rad) * radius;
            var y_pos = mouse_y + sin(rad) * radius;

            instance_create_layer(x_pos, y_pos, "Instances_Cards", card_data.obj);
        }

        global.elixir -= card_data.cost;
        show_debug_message("deployed troop: " + string(card_data.obj));
		

        if (array_length(cards_available) == 0) {
            cards_available = array_shuffle(discard_pile);
            discard_pile = [];
            show_debug_message("deck reshuffled (troop)");
        }

        if (array_length(cards_available) > 0) {
            var new_card = array_pop(cards_available);
            hand[selected_card] = new_card;
        } else {
            show_debug_message("WARNING: No available cards to draw!");
        }

        array_push(discard_pile, card_data);
        selected_card = -1;
		
    }

  
    else if (card_data.type == "spell" && mouse_y < 1800) {
        if (card_data.obj == oBlueArrow) {
            arrow_spell(mouse_x, mouse_y, arrowradius, arrowdmg, arrowtowerdmg);
        } else if (card_data.obj == oFireball) {
            arrow_spell(mouse_x, mouse_y, fireballradius, fireballdmg, fireballtowerdmg);
        }

        global.elixir -= card_data.cost;
        show_debug_message("deployed spell: " + string(card_data.obj));

        if (array_length(cards_available) == 0) {
            cards_available = array_shuffle(discard_pile);
            discard_pile = [];
            show_debug_message("deck reshuffled (spell)");
        }

        if (array_length(cards_available) > 0) {
            var new_card = array_pop(cards_available);
            hand[selected_card] = new_card;
        } else {
            show_debug_message("WARNING: No available cards to draw!");
        }

        array_push(discard_pile, card_data);
        selected_card = -1;
    }
}
