function delay(duration) { // In milliseconds
    var timeStart = new Date().getTime();

    while (new Date().getTime() - timeStart < duration) {
        // Do nothing
    }

    // Duration has passed
}
