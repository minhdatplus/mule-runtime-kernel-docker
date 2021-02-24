#!/bin/bash

image_tag=$1
mule_version=4.2.0
repository=mule-standalone-${mule_version}-hf1
container=mule-standalone-${mule_version}-hf1-${image_tag}
# From this shared directory between the host operating system and the Docker container, you will have access to log files.
mule_logs_dir="$(pwd)/mule-${mule_version}/logs"
Echo "Creating shared logs directory on host [ ${mule_logs_dir} ]"
mkdir -v -p ${mule_logs_dir} 
Echo "Running Docker Container: ${container}"
docker run -it -p 8091:8091 -d -v "${mule_logs_dir}":/opt/mule/logs --name ${container} ${repository}:${image_tag} 
docker ps -a