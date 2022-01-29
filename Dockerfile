# it's official and small so i'm using it
FROM node:17.4.0-alpine3.15

# first we need to copy everything
COPY . /drone-heroku-deploy-container

# Heroku cli requires git installed as well as podman to build the containers which requires openrc to configure rcgroups
RUN apk add --no-cache git openrc podman

# podman requires enabling cgroups
RUN rc-update add cgroups

# now we install the heroku
RUN npm install -g heroku

# set the workdir to be the folder where all the data is so relative file names will work as expected
WORKDIR /drone-heroku-deploy-container

# run the script that does the actual work when the container starts
CMD ["sh", "/drone-heroku-deploy-container/drone_heroku_deploy_container.sh"]
