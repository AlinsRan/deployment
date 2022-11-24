ISTIO_RELEASE=1.13.1
YOUR_REGISTRY="api7"

kubectl create namespace istio-system

helm install istio-base --namespace istio-system ./base

helm install istio-discovery \
  --namespace istio-system \
  --set pilot.image=istio/pilot:1.13.1 \
  --set global.proxy.privileged=true \
  --set global.proxy_init.hub="api7" \
  --set global.proxy_init.image=amesh-iptables \
  --set global.proxy_init.tag=v0.0.2 \
  --set global.proxy.hub="api7" \
  --set global.proxy.image=amesh-apisix \
  --set global.proxy.tag=v0.0.2 \
  --set global.imagePullPolicy=IfNotPresent \
  --set global.hub="docker.io/istio" \
  --set global.tag="1.13.1" \
  ./istio-discovery
 