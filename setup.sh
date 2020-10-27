minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

# Make metallb
minikube addons enable metallb
kubectl apply -f srcs/metallb_config.yaml

# Containers
docker build -t nginx_image ./srcs/

# Create files .yaml
kubectl apply -f srcs/nginx/nginx.yaml
