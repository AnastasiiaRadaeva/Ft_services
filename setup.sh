# minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

minikube dashboard & #открываем дашборд на заднем фоне

# Make metallb
minikube addons enable metallb
kubectl apply -f srcs/metallb_config.yaml

kubectl apply -f ./srcs/volume.yaml

# Containers
docker build -t nginx_image ./srcs/nginx
docker build -t ftps_image ./srcs/FTPS
docker build -t mysql_image ./srcs/MySQL
docker build -t php_image ./srcs/phpMyAdmin
docker build -t wordpress_image ./srcs/WordPress

# Create files .yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/FTPS/ftps.yaml
kubectl apply -f srcs/MySQL/mysql.yaml
kubectl apply -f srcs/phpMyAdmin/php.yaml
kubectl apply -f srcs/WordPress/wordpress.yaml
