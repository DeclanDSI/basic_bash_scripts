#!/bin/bash

directory="$HOME/.ssh"
file="$HOME/.ssh/authorized_keys"

if [ ! -d "$directory" ]; then 
	echo "Directory does not exist, making it..."
	mkdir $HOME/.ssh;
else
	echo "Directory exists.";
fi

if [ ! -f "$file" ]; then
	echo ".ssh/authorized_keys file does not exist, making it..."
	touch $HOME/.ssh/authorized_keys;
else
	echo "File exists.";
fi

sudo chmod 770 $HOME/.ssh/authorized_keys

echo "Creating public-private key pair in $HOME/.ssh folder named as $USER."
ssh-keygen -t rsa -N '' -f $HOME/.ssh/$USER

cat $HOME/.ssh/$USER.pub >> $HOME/.ssh/authorized_keys

sudo chmod 600 $HOME/.ssh/$USER
sudo chmod 600 $HOME/.ssh/authorized_keys