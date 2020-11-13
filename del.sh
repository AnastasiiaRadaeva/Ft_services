kubectl delete deployment nginx-deployment
kubectl delete service nginx-svc

kubectl delete deployment ftps-deployment
kubectl delete service ftps-svc

kubectl delete deployment php-deployment
kubectl delete service php-svc

kubectl delete deployment mysql-deployment
kubectl delete service mysql-svc

kubectl delete deployment wordpress-deployment
kubectl delete service wordpress-svc

kubectl delete deployment grafana-deployment
kubectl delete service grafana-svc

kubectl delete deployment influxdb-deployment
kubectl delete service influxdb-svc

kubectl delete deployment telegraf-deployment

minikube stop
minikube delete