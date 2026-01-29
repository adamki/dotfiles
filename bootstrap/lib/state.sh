STATE_DIR="$HOME/.bootstrap_state"

mkdir -p "$STATE_DIR"

is_done() {
    [[ -f "$STATE_DIR/$1.done" ]]
}

mark_done() {
    touch "$STATE_DIR/$1.done"
}
