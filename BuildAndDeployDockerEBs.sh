#!/usr/bin/env bash

# create Eb docker run file in deploy folder and deploy to EB
rm -rf deploy
mkdir deploy
cd deploy
EBS_DEPLOY='
{
  "AWSEBDockerrunVersion": "1",
  "Image": {
    "Name": "ahmadyounus/firstcontainer",
    "Update": "true"
  },
  "Ports": [
    {
      "ContainerPort": "4002"
    }
  ]
}'

echo $EBS_DEPLOY > Dockerrun.aws.json
eb init --region eu-west-1 --platform docker tutorials1-ebs 

# EB_Action : create or deploy
eb create tutorials1-ebs  --region eu-west-1  
