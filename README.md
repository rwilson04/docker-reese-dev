Reese's development container

#Usage
##Generic
Start a container based on the `shinymayhem/reese-dev` image, which should get volumes from reese-secrets, a container providing github config and credentials in the /secrets directory. Expose a port for SSH.

###Example .yml
```yml
reese-secrets:
  image: tutum.co/shinymayhem/secrets
reese-dev:
  image: shinymayhem/reese-dev
  volumes_from:
    - reese-secrets
    - other-app
  ports:
    - "2222:22"
other-app:
  image: other/image
```

##Node JS apps
For development of node js apps, use the `shinymayhem/reese-dev:node` tag. Provide environment variables for code source and location

###Example .yml
```yml
reese-secrets:
  image: private/secrets/image
reese-dev:
  image: shinymayhem/reese-dev:node
  volumes_from:
    - reese-secrets
  ports:
    - "2222:22"
  environment: 
    REPO: git@github.com:shinymayhem/micro-token-gen
    CODE_DIR: /var/www
token-gen:
  image: shinymayhem/micro-token-gen #or other image with shinymayhem/node:onbuild as parent
  ports:
    - "8080:80"
  environment:
    COPY_TO_VOLUME: false
    INDEX_DIR: /var/www/src
```
