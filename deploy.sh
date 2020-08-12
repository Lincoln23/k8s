docker build -t lincoln23/client:latest -t lincoln23/client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t lincoln23/server:latest -t lincoln23/server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t lincoln23/worker:latest -t lincoln23/worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push lincoln23/client:latest
docker push lincoln23/client:$GIT_SHA

docker push lincoln23/server:latest
docker push lincoln23/server:$GIT_SHA

docker push lincoln23/worker:latest
docker push lincoln23/worker:$GIT_SHA

kubectl apply -f k8s

kubectl set image deployment/client-deployment client=lincoln23/client:$GIT_SHA
kubectl set image deployment/server-deployment server=lincoln23/server:$GIT_SHA
kubectl set image deployment/worker-deployment worker=lincoln23/worker:$GIT_SHA
