FROM shinymayhem/dev

RUN \
	useradd -m reese && \
	usermod -a -G admin reese && \
	cd /home/reese && \
	git clone http://github.com/shinymayhem/home && \
	cp -R home/. . && \
	echo 'so ~/.syncedvimrc' > .vimrc


ADD run.sh /run.sh

RUN chmod +x /run.sh

WORKDIR /home/reese

CMD ['run.sh']
