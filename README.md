# apiSampleJava

## Status

|CI          |develop |master |
|--          |-|-|
|Circle CI   |[![CircleCI](https://circleci.com/gh/caio2k/apiSampleJava/tree/develop.svg?style=svg)](https://circleci.com/gh/caio2k/apiSampleJava/tree/develop)|[![CircleCI](https://circleci.com/gh/caio2k/apiSampleJava/tree/master.svg?style=svg)](https://circleci.com/gh/caio2k/apiSampleJava/tree/master)|
|Docker Cloud| ![Docker Build](https://img.shields.io/docker/build/caio2k/apisamplejava.svg)|

## Deploy

|CD    |staging |production |
|--    |-|-|
|Heroku|[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://dashboard.heroku.com/new?template=https%3A%2F%2Fgithub.com%2Fcaio2k%2FapiSampleJava-gitops%2Ftree%2Fstaging) |[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://dashboard.heroku.com/new?template=https%3A%2F%2Fgithub.com%2Fcaio2k%2FapiSampleJava-gitops%2Ftree%2Fmaster)|

## Description
This repo controls the deployment of [apiSampleJava](https://github.com/caio2k/apiSampleJava) in [heroku](https://heroku.com) through [circleci](https://circleci.com) using [gitops](https://www.weave.works/blog/what-is-gitops-really) approach.

## Deployment flow

### [apiSampleJava](https://github.com/caio2k/apiSampleJava) workflow using [gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)

#### Steps
1. Clone the *repo*
1. Create a *branch*
1. *Commit* the code you want
1. *Push* the code
1. When you are happy with your code, create a *PR* (Pull Request) from the created *branch* to the develop *branch*
1. Wait for the tests to pass and approve the *PR* to develop
1. When you are happy with develop, create a *PR* from develop to `master`
1. Wait for the tests to pass and approve the *PR* to `master`
1. When you are happy with `master`, create a git *tag* with a version number (x.y.z) in the `master` *commit* and *push* it.

#### What happens behind the scenes
- Every *commit* in the `develop` and `master` is verified by both [circleci](https://circleci.com/gh/caio2k/apiSampleJava) and [docker cloud](https://cloud.docker.com/repository/docker/caio2k/apisamplejava/builds).
- If a *tag* is added following the versioning convention (x.y.z):
   - Promotion: a [circleci](https://circleci.com/gh/caio2k/apiSampleJava) build is launched to promote the `master` *commit* to the *tag* version
   - Update gitops repo: the new *tag*

### [apiSampleJava-gitops](https://github.com/caio2k/apiSampleJava-gitops) workflow using [gitops](https://www.weave.works/blog/what-is-gitops-really)
1. Go to the [link](https://apisamplejava-staging.herokuapp.com/) where the application was deployed using the *tag*.
1. If you want to promote it to production, create a *PR* from `staging` *branch* to `master` *branch* in [apiSampleJava-gitops](https://github.com/caio2k/apiSampleJava-gitops) repo
