# drone-heroku-deploy-container

CI/CD build status: [![Build Status](https://cloud.drone.io/api/badges/naorlivne/drone-heroku-deploy-container/status.svg)](https://cloud.drone.io/naorlivne/drone-heroku-deploy-container)

Drone plugin for publishing container images to Heroku, behind the scenes it uses heroku CLI to run `heroku container:push` and `heroku container:release` commands.

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
    heroku_api_key: my...vary...long...kube...token
    heroku_process_type: web
    heroku_app_name: my_amazing_app
```

## Parameter Reference

#### heroku_api_key

The kubernetes API server URL (no trailing slash should be used), alternately mount a kubeconfig into the container `/root/.kube/config`

#### heroku_process_type

The token used to auth against the kubernetes API, alternately mount a kubeconfig into the container `/root/.kube/config`

#### heroku_app_name

The kubernetes deployment configuration file location relative to the root folder of the repo, defaults to `injected_deployment.yaml`
