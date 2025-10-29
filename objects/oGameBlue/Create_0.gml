// --- GAME STATE ---
global.redkingdead = false;
global.bluekingdead = false;
global.bluetowerslost = 0;
global.redtowerslost = 0;
prevcard = noone
randomize();
show_debug_message("debug");

isFullscreen = false;
global.elixir = 10;
ismuted = false;

timetocreate = 300;
cardsomething = noone;
global.redtowers = 0;
global.bluetowers = 0;
alarm[0] = 1;
maxElixir = 10;
elixirgeneration = 168;
arrowtowerdmg = 63
arrowradius = 210
arrowdmg = 366
fireballtowerdmg = 207
fireballdmg = 688
fireballradius = 150
arrowspeed = 0.03
fireballspeed = 0.02



cards = [];
for (var i = 0; i < ds_list_size(global.selected_deck); i++) {
    cards[i] = global.cards_all[ global.selected_deck[| i] ];
}



cards_available = array_shuffle(cards); 
discard_pile = [];
hand = array_create(4);


for (var i = 0; i < 4; i++) {
    hand[i] = array_pop(cards_available);
}

selected_card = -1;
grid_size = 15;


show_debug_message("Deck initialized. Cards available: " + string(array_length(cards_available)));
show_debug_message("Hand contains:");
for (var i = 0; i < 4; i++) {
    show_debug_message("  " + string(hand[i].obj));
}
