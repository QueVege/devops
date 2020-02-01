#!/usr/bin/env bash
ssh $DEPLOYMENT_SERVER_USERNAME@$DEPLOYMENT_SERVER_IP << 'ENDSSH'
 mkdir -p ~/dj
 scp -r ./* $DEPLOYMENT_SERVER_USERNAME@$DEPLOYMENT_SERVER_IP:~/dj
 cd ~/dj
 docker login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
 docker pull $CI_REGISTRY/$CI_PROJECT_PATH
 docker-compose -f $DOCKER_COMPOSE_FILE_PATH up -d
ENDSSH