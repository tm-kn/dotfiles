#!/bin/sh
set -e

SCREENSHOT_FILENAME="Screenshot_%s_%H%M_%d.%m.%Y_\$wx\$h.png"
CMD=scrot
AREA=false
CLIPBOARD=false
WINDOW=false
SCROT_PARAMS=

for item do # looping over the  elements of the $@ array ($1, $2...)
    case $item in
        --area)
            AREA=true
        ;;
        --clipboard)
            CLIPBOARD=true
        ;;
        --window)
            WINDOW=true
        ;;
    esac
done

if [ $CLIPBOARD = true ]; then
    DEST="/tmp/$SCREENSHOT_FILENAME"
    E_FLAG="xclip -selection c -t image/png < \$f"
else
    DEST="$HOME/Pictures/$SCREENSHOT_FILENAME"
fi

if [ $AREA = true ]; then
    SCROT_PARAMS=$SCROT_PARAMS" -s "
fi

if [ $WINDOW = true ]; then
    SCROT_PARAMS=$SCROT_PARAMS" -u "
fi


if [ -n "$E_FLAG" ]; then
    exec $CMD "$DEST" $SCROT_PARAMS -e "$(echo $E_FLAG)"
else
    exec $CMD "$DEST" $SCROT_PARAMS
fi
