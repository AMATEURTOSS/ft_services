cd ~/goinfre
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl"
chmod +x ./kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
mv minikube-darwin-amd64 minikube
chmod +x minikube
cd - > /dev/null