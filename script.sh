THEME_DIR="/home/arpit/Documents/pre-built/arpit/config/sddm/sddm-anime"
LAST_MOD=$(find "$THEME_DIR" -type f -exec stat -c %Y {} + | sort -nr | head -n 1)

while true; do
    sleep 1
    NEW_MOD=$(find "$THEME_DIR" -type f -exec stat -c %Y {} + | sort -nr | head -n 1)
    if [[ $NEW_MOD != $LAST_MOD ]]; then
        LAST_MOD=$NEW_MOD
        echo "Change detected, reloading greeter..."
        pkill sddm-greeter-qt6
        sddm-greeter-qt6 --test-mode --theme "$THEME_DIR" &
    fi
done
