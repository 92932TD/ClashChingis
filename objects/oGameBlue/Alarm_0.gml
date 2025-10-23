show_debug_message("----- Cards -----");
for (var i = 0; i < array_length(cards); i++) {
    var c = cards[i];
    show_debug_message(string(i) + ": " + object_get_name(c.obj)
                       + " | cost " + string(c.cost) + " | type " + string(c.type));
}
