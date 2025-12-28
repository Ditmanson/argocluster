apiVersion: networking.istio.io/v1
kind: VirtualService
metadata:
  name: tdebian
  namespace: tdebian
spec:
  hosts:
    - "tdebian.com"
  gateways:
    - nginx-gateway
  http:
    - route:
        - destination:
            host: tdebian-service.tdebian.svc.cluster.local
