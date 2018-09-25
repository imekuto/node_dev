
COMMAND='export DEBIAN_FRONTEND=noninteractive'
echo $COMMAND && eval ${COMMAND}

COMMAND='sudo -E apt update'
echo $COMMAND && eval ${COMMAND}
COMMAND='sudo -E apt upgrade -y'
echo $COMMAND && eval ${COMMAND}

COMMAND='sudo -E apt install expect -y'
echo $COMMAND && eval ${COMMAND}
