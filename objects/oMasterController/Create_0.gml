global.song_list = [
    song_1, song_2, song_3, song_4, song_5, song_6, song_7, song_8,
    song_9, song_10, song_11, song_12, song_13, song_14, song_15, song_16,
    song_17, song_18, song_19, song_20, song_21, song_22, song_23, song_24,
    song_25, song_26, song_27, song_28, song_29, song_30, song_31, ukelele,
	Sound33, Sound34, Sound35, Sound36, Sound37, Sound38, Sound39, Sound40, 
	Sound41, Sound42, Sound43, Sound44, Sound45, Sound46, Sound47
];

global.current_song = -1; 
global.song_index = 0
randomize()
shuffle(global.song_list)
ismuted = false
global.ipaddress = noone
global.port = -1

if !global.isRed {
global.cards_all = [
    { obj: oBerserker, sprite: sBerserker, cost: 2, type: "troop", num: 1},
    { obj: oKnight, sprite: sKnight, cost: 3, type: "troop", num: 1},
    { obj: oArcher, sprite: sArcher, cost: 3, type: "troop", num: 2},
    { obj: oHogRider, sprite: sHogRider, cost: 4, type: "troop", num: 1},
    { obj: oValkyrie, sprite: sValk, cost: 4, type: "troop", num: 1},
    { obj: oPekka, sprite: sPekka, cost: 7, type: "troop", num: 1},
    { obj: oBlueArrow, sprite: sBlueArrowInHand, cost: 3, type: "spell", num: 1},
    { obj: oMusk, sprite: sMusk, cost: 4, type: "troop", num: 1},
	{ obj: oBlueCannon, sprite: sCannon, cost: 3, type: "troop" , num: 1},
	{ obj: oFireball, sprite: sFireball, cost: 4, type: "spell",num: 1 },
	{ obj: oMegaKnight, sprite: sMegaknight, cost: 7, type: "troop",num: 1},
	{ obj: oSkeletons , sprite: sSkeletonInHAnd, cost: 1, type: "troop",num: 3},
	{ obj: oSkeletons, sprite: sSkarmy, cost: 3, type: "troop",num: 15},
	{ obj: oBlueElixirGen, sprite: sElixirPump, cost: 6, type: "troop",num: 1}

];
} else if global.isRed {
	global.cards_all = [
    { obj: oRedBerserker, sprite: sBerserker, cost: 2, type: "troop", num: 1},
    { obj: oRedKnight, sprite: sKnight, cost: 3, type: "troop", num: 1},
    { obj: oRedArcher, sprite: sArcher, cost: 3, type: "troop", num: 2},
    { obj: oRedHogRider, sprite: sHogRider, cost: 4, type: "troop", num: 1},
    { obj: oRedValkyrie, sprite: sValk, cost: 4, type: "troop", num: 1},
    { obj: oRedPekka, sprite: sPekka, cost: 7, type: "troop", num: 1},
    { obj: oArrow, sprite: sBlueArrowInHand, cost: 3, type: "spell", num: 1},
    { obj: oRedMusk, sprite: sMusk, cost: 4, type: "troop", num: 1},
	{ obj: oRedCannon, sprite: sCannon, cost: 3, type: "troop", num: 1 },
	{ obj: oFireball, sprite: sFireball, cost: 4, type: "spell", num: 1 },
	{ obj: oRedMegaKnight, sprite: sMegaknight, cost: 7, type: "troop", num: 1},
	{ obj: oRedSkeletons, sprite: sSkeletonInHAnd, cost: 1, type: "troop",num: 3},
	{ obj: oRedSkeletons, sprite: sSkarmy, cost: 3, type: "troop",num: 15},
	{obj: oRedElixirGen, sprite: sElixirPump, cost: 6, type: "troop", num: 1}
	
];
}
	
selected_deck = ds_list_create(); 

cols = 5;     
size = 100;  
pad  = 20;    
scroll_offset = 0;


if (!variable_global_exists("selected_deck")) {
    global.selected_deck = ds_list_create();
}



