minikube start --vm-driver=virtualbox --cpus=4 --memory=6128 --disk-size=10000

eval $(minikube docker-env)

minikube dashboard & #открываем дашборд на заднем фоне

# Make metallb
minikube addons enable metallb
kubectl apply -f srcs/metallb_config.yaml

# Containers
docker build -t nginx_image ./srcs/nginx
docker build -t ftps_image ./srcs/FTPS
docker build -t mysql_image ./srcs/MySQL
docker build -t php_image ./srcs/phpMyAdmin
docker build -t wordpress_image ./srcs/WordPress
docker build -t influxdb_image ./srcs/InfluxDB
docker build -t telegraf_image ./srcs/Telegraf
docker build -t grafana_image ./srcs/Grafana

# Create files .yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/FTPS/ftps.yaml
kubectl apply -f srcs/MySQL/mysql.yaml
kubectl apply -f srcs/MySQL/mysql_volume.yaml
kubectl apply -f srcs/phpMyAdmin/php.yaml
kubectl apply -f srcs/WordPress/wordpress.yaml
kubectl apply -f srcs/InfluxDB/influxdb-volume.yaml
kubectl apply -f srcs/InfluxDB/influxdb-configmap.yaml
kubectl apply -f srcs/InfluxDB/influxdb.yaml
kubectl apply -f srcs/Telegraf/telegraf.yaml
kubectl apply -f srcs/Grafana/grafana.yaml


# check
# kubectl exec deploy/ftps-deployment -- pkill vsftpd
# kubectl exec deploy/grafana-deployment -- pkill grafana
# kubectl exec deploy/telegraf-deployment -- pkill telegraf
# kubectl exec deploy/influxdb-deployment -- pkill influx
# kubectl exec deploy/wordpress-deployment -- pkill nginx
# kubectl exec deploy/wordpress-deployment -- pkill php-fpm7
# kubectl exec deploy/php-deployment -- pkill nginx
# kubectl exec deploy/php-deployment -- pkill php-fpm7
# kubectl exec deploy/mysql-deployment -- pkill /usr/bin/mysqld 
# kubectl exec deploy/nginx-deployment -- pkill nginx
# kubectl exec deploy/nginx-deployment -- pkill sshd