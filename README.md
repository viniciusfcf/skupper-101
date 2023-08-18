# Demo

## Os 4 passos para conectar utilizando Skupper

# Pre requisitos
- Estar logado em um OpenShift
- CLI do skupper
- As apps estarem rodando 
  - front no OpenShift
  - payment no sandbox com skupper já inicializado

## Detalhes importantes
- Para conectar 2 clusters, link
- Para conectar cluster com VM ou bare metal: 
  - Gateway
  - [Link utilizando podman como um cluster](https://skupper.io/docs/cli/podman.html)
    - Skupper podman allow you to create a site using containers, without requiring Kubernetes

## Glossário
- Address: 

VANs provide multiple routing patterns, so communications can be distributed in anycast (balanced or closest) or multicast patterns.

### OpenShift to bare metal

 TL;DR:
- skupper init --enable-console --enable-flow-collector --console-auth unsecured
- skupper gateway init --config simple_docker.yaml --type docker
- skupper expose service database --address database --port 5432 --protocol tcp
- skupper gateway bind database localhost 5432


COMPLETO:

- skupper init --enable-console --enable-flow-collector --console-auth unsecured
- skupper gateway init --type docker
  - skupper gateway init --config simple_docker.yaml --type docker
- skupper expose service <NAME> --address <...> --port <...>
  - Essa configuração cria o service no OpenShift
  - skupper expose service database --address database --port 5432 --protocol tcp
- skupper gateway bind <address> <host> <port>
  - skupper gateway bind database host.docker.internal 5432
  - skupper gateway bind database localhost 5432
  - No MacOS esse bind ainda não está funcionando, as portas para isso não foram expostas corretamente, workaround: Iniciar o gateway com a configuração do bind, ex:
    - skupper gateway init --config [simple_docker.yaml](https://raw.githubusercontent.com/viniciusfcf/service-interconnect-sandbox-demo/main/simple_docker.yaml) --type docker

### OpenShift to OpenShift

Conf no Front
- skupper token create front.json

Conf no Sandbox
- skupper init --enable-console --enable-flow-collector --console-auth unsecured
- skupper link create front.json


## OpenShift to localhost (Linux)

## Links uteis
- https://skupper.io/docs/cli/index.html#link-cost

## Bugs encontrados
- Bind no MacOS não está funcionando
- Bind no linux não funciona com host.docker.internal, mas funciona com o localhost
