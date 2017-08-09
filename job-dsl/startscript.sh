docker service rm pipelinedemo
docker service create  -p 5600:5000 --network swarmdemonet  --name pipelinedemo  --limit-cpu=1 --replicas=5  anilskp/pipelinedemo:latest
