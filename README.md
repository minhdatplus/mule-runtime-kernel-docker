## Components 
Software components and versions used.

* MuleSoft Kernel(without Anypoint Studio) Version: 4.2.0
* JDK Version: Open JDK 1.8

## Dockerizing the Mule Kernel

Information about Mule Runtime Docker image creation, container creation, execution and deletion.

### Pre-requisites

* Docker Version 17.12+
* Download the MuleSoft Kernel: 4.2.0 https://developer.mulesoft.com/download-mule-esb-runtime
    * Rename the zip file to: *mule-standalone-VERSION.zip* 
    * It must be placed at the Dockerfile label.

### Build Docker Image Of the Mule Runtime

1. Run:
```$> ./build_image.sh {image_tag} ```
Example:
        ```
        ./build_image.sh 1.0
        ```
### Create the Container
1. Run: ```sudo ./run_container.sh {image_tag}```

    Example:
        ```
        ./run_container.sh 1.0
        ```
2. Start the Mule Kernel the Container.

```docker exec -it {mule_container_name} /opt/mule/bin/mule start```

### Removing the Container
1. Look for the Container Name and Id to remove: ```docker ps -a```
2. Stop the runtime: ```docker exec -it {mule_container_name} /opt/mule/bin/mule stop```
2. Stop the container: ```docker container stop {container_id}```
3. Remove the container: ```docker container rm --force {container_id}```
    Example:
        ```docker container rm b25aabb8787c```
4. Verify the Container has been effectively removed: ```docker ps -a```

### Removing the Docker Image

1. List Docker images: ```$> docker image ls  ```
2. Remove Docker Image: ```$> docker image rm --force {image_id} ```

    Example:
        ```$> docker image rm --force 73e701c1401c ```

### Related assets
These assets are related to the following resources:
* https://wiki.corp.mulesoft.com/display/SVCS/Dockerizing+Mule+ESB
* https://wiki.corp.mulesoft.com/display/SVCS/Register+Mule+Runtime+to+ARM+Programatically
* https://docs.mulesoft.com/runtime-manager/runtime-manager-agent-architecture