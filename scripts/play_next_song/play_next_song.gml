function play_next_song() {
 
    if (audio_is_playing(global.current_song)) {
        audio_stop_sound(global.current_song);
    }

  
    global.song_index++;
    if (global.song_index >= array_length(global.song_list)) {
        global.song_index = 0; 
    }

   
    global.current_song = global.song_list[global.song_index];
    audio_play_sound(global.current_song, 1, false);

    show_debug_message("Now playing: " + string(global.song_index));
}
