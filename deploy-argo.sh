kubectl create namespace argocd
helm dependency build ./argocd-app/
helm install -f ./argocd-app/values.yaml -f ./argocd-app/values-environment.yaml argocd-app-default --namespace argocd ./argocd-app/
helm template ./argocd-config/ | kubectl apply -f -
helm dependency build ./ingress-nginx/
helm install -f ./ingress-nginx/values-environment.yaml ingress-nginx-default --namespace ingress-nginx ./ingress-nginx/
kubectl get svc -ningress-nginx
kubectl create namespace haproxy
helm dependency build ./haproxy/
helm install -f ./haproxy/values-environment.yaml haproxy-default --namespace haproxy ./haproxy/
