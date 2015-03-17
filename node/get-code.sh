#!/bin/bash

if [ $CODE_DIR != "changeme" ]
then
	cd $CODE_DIR
	echo "Code dir: $CODE_DIR \n"
	chown -R reese:reese ./
	if [ `find ./ -prune -empty` ]
	then
		#sudo -u reese -H sh -c "
		sudo -u reese /bin/sh <<-token
			cd $CODE_DIR
			git init
			git remote add origin $REPO
			git fetch
			git merge origin/master
			echo "Fetched and merged"
		token
		NPM_DIR=$(find ./ -maxdepth 2 -name 'package.json' | xargs dirname)
		cd $NPM_DIR
		echo $(pwd)
		npm install
		#"
	else
		echo "Directory not empty. Leaving it alone \n";
	fi
else
	echo "Please set CODE_DIR environment variable if you want to initialize a directory with code from a repository \n"
fi
echo "finished \n"
