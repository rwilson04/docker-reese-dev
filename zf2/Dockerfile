FROM shinymayhem/reese-dev

ENV REPO changeme
ENV CODE_DIR changeme

ADD get-code.sh /opt/deploy/get-code.sh
RUN chmod +x /opt/deploy/*.sh

VOLUME /var/www/html

CMD sh -c '/bin/bash /opt/deploy/init-home.sh; /bin/bash /opt/deploy/get-code.sh; /bin/bash /opt/deploy/ssh.sh'
