 #!/bin/sh

args=""

if [ -n "$SALT" ]; then
  args="$args --salt=$SALT"
  echo Salt set to $SALT
fi

if [ -n "$PORT" ]; then
  args="$args --port=$PORT"
  echo Port set to $PORT
fi

if [ "$ISOLATE" == "TRUE" ]; then
  args="$args --isolate-rooms"
  echo Rooms Isolated
fi

if [ "$DISABLEREADY" == "TRUE" ]; then
  args="$args --disable-ready"
  echo Readiness Indicator Disabled
fi

if [ "$DISABLECHAT" == "TRUE" ]; then
  args="$args --disable-chat"
  echo Chat Disabled
fi

if [ -n "$MAXCHATLENGTH" ]; then
  args="$args --max-chat-message-length=$MAXCHATLENGTH"
  echo Max Chat Message Length set to $MAXCHATLENGTH
fi

if [ -n "$MAXUNAMELENGTH" ]; then
  args="$args --max-username-length=$MAXUNAMELENGTH"
  echo Max Username Length set to $MAXUNAMELENGTH
fi

if [ -n "$MOTD" ]; then
  echo "$MOTD" >> /app/syncplay/motd
  args="$args --motd-file=/app/syncplay/motd"
  echo MOTD set to $MOTD
fi

if [ -n "$PASSWORD" ]; then
  args="$args --password=$PASSWORD"
  echo Password set to $PASSWORD
fi

if [ "$TLS" == "TRUE" ]; then
  args="$args --tls=/certs"
  echo Certs Enabled
fi


exec $(eval "./syncplayServer.py $args $@")
