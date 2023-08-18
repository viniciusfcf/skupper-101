# https://github.com/viniciusfcf/service-interconnect-sandbox-demo
oc apply -f payment-processor.yaml
skupper expose deployment/payment-processor --port 8080
