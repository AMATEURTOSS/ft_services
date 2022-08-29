# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP#Configuration_of_PHP7

printf '\ec'
printf '\e[1;32m%s\n\e[0m' '
███████╗████████╗     ███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗███████╗
██╔════╝╚══██╔══╝     ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝██╔════╝
█████╗     ██║        ███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗  ███████╗
██╔══╝     ██║        ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝  ╚════██║
██║        ██║███████╗███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗███████║
╚═╝        ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝╚══════╝'

# -----------------------minikube-----------------------
minikube start --driver=virtualbox

# -----------------------dashboard-----------------------
eval $(minikube -p minikube docker-env)
minikube dashboard &

# -----------------------metalLB-----------------------
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb.yaml

# -----------------------mysql-----------------------
docker build -t mysql ./srcs/mysql/
kubectl apply -f ./srcs/mysql/mysql.yaml

# -----------------------phpmyadmin-----------------------
docker build -t phpmyadmin ./srcs/phpmyadmin/
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

# -----------------------wordpress-----------------------
docker build -t wordpress ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# -----------------------ftps-----------------------
docker build -t ftps ./srcs/ftps/
kubectl apply -f ./srcs/ftps/ftps.yaml

# -----------------------influxdb-----------------------
docker build -t influxdb ./srcs/influxdb/
kubectl apply -f ./srcs/influxdb/influxdb.yaml

# -----------------------grafana-----------------------
docker build -t grafana ./srcs/grafana/
kubectl apply -f ./srcs/grafana/grafana.yaml

# -----------------------nginx-----------------------
docker build -t nginx ./srcs/nginx/
kubectl apply -f ./srcs/nginx/nginx.yaml