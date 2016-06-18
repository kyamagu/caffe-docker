#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-0}

if [ "$USER_ID" -gt 0 ]
then
  echo "Starting with UID : $USER_ID"
  useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
  echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user
  mkhomedir_helper user
  export HOME=/home/user
  cd $HOME
  exec /usr/local/bin/gosu user "$@"
else
  export HOME=/home/user
  mkdir -p /home/user
  cd $HOME
  exec "$@"
fi
