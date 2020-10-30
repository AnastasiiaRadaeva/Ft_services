# minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

minikube dashboard & #открываем дашборд на заднем фоне

# Make metallb
minikube addons enable metallb
kubectl apply -f srcs/metallb_config.yaml

# Containers
docker build -t nginx_image ./srcs/nginx
docker build -t ftps_image ./srcs/FTPS

# Create files .yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/FTPS/ftps.yaml
