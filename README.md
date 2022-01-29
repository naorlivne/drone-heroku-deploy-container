# drone-heroku-deploy-container

CI/CD build status: [![Build Status](https://cloud.drone.io/api/badges/naorlivne/drone-heroku-deploy-container/status.svg)](https://cloud.drone.io/naorlivne/drone-heroku-deploy-container)

Drone plugin for publishing container images to Heroku, behind the scenes it uses heroku CLI to run `heroku container:release` commands.

## Usage

This plugin can be used to deploy container images to Heroku.

The below pipeline configuration demonstrates simple usage:


```yaml
kind: pipeline
type: docker
name: default

steps:
- name: drone_heroku_deploy_container
  image: naorlivne/drone-heroku-deploy-container
  settings:
    heroku_api_key: 
      from_secret: my...vary...long...heroku...token
    heroku_process_type: web
    heroku_app_name: my_amazing_app
```

## Parameter Reference

#### heroku_api_key

The api key for Heroku.

#### heroku_process_type

The process type to deploy the container to, defaults to `web`.

#### heroku_app_name

The app name to deploy the container to.
