#### Alpine Workbench

Just a simple Docker wrapper for common tool platform while testing, debugging, etc
in the Docker Swarm Environment. Responds to requests.

```
docker service create --name platform-testing \
  --constraint "node.role==manager" \
  --mode "global" \
  --publish ":8080" \
  --mount type=volume,source=some-volume,destination=/data/some-volume \
  composer22/alpine-workbench:latest
```
