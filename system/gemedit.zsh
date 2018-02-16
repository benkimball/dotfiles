gemedit() {
    (code `gem which $1 | sed -E "s:/[^/]+$::"`)
}
