function shuffle(arr) {
    var len = array_length(arr);
    for (var i = len-1; i > 0; i--) {
        var j = irandom(i);
        var temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
    return arr;
}
