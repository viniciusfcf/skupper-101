# https://github.com/viniciusfcf/service-interconnect-sandbox-demo
oc new-app quay.io/redhatintegration/patient-portal-frontend
oc expose deployment patient-portal-frontend --port=8080
oc create route edge --service=patient-portal-frontend --insecure-policy=Redirect
oc set env deployment/patient-portal-frontend DATABASE_SERVICE_HOST=database
oc get route patient-portal-frontend -o jsonpath='{.spec.host}{"\n"}'
