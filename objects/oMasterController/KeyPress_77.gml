if (!ismuted) {
    audio_pause_all();
    ismuted = true;
} else {
    audio_resume_all();
    ismuted = false;
}
