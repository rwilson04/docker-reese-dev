#!/bin/bash

cd $CODE_DIR
chown -R reese:reese ./
if [ `find ./ -prune -empty` ]
then
	sudo su reese
	git init
	git remote add origin $REPO
	git fetch
	git merge origin/master
	NPM_DIR = find ./ -maxdepth 2 -name `package.json` | xargs dirname
	cd NPM_DIR
	npm install
fi
