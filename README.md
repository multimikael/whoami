# whoami
Simple network whoami to STDOUT with https://www.cloudflare.com/cdn-cgi/trace.

## Docker
whoami is available as a Docker image, and can also be found on [Docker Hub](https://cloud.docker.com/repository/docker/multimikael/whoami). Run Docker image:
```sh
docker run multimikael/whoami
```
If your desired architecture is not available, you can try to build the image yourself by:
```sh
docker build -t multimikael/whoami .
```
