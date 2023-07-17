# Demo

## Os 4 passos para conectar utilizando Skupper

# Pre requisitos
- Estar logado em um OpenShift
- CLI do skupper
- As apps estarem rodando 

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
- skupper init --enable-console --enable-flow-collector --console-auth unsecured
- skupper gateway init --type docker
- skupper expose service <NAME> --address <...> --port <...>
  - Essa configuração cria o service no OpenShift
- skupper gateway bind <address> <host> <port>
  - No MacOS esse bind ainda não está funcionando, as portas para isso não foram expostas corretamente, workaround: Iniciar o gateway com a configuração do bind, ex:
    - skupper gateway init --config [simple_docker.yaml](https://raw.githubusercontent.com/viniciusfcf/service-interconnect-sandbox-demo/main/simple_docker.yaml) --type docker

### OpenShift to OpenShift

## OpenShift to localhost (MacOS)
- https://github.com/viniciusfcf/service-interconnect-sandbox-demo


## OpenShift to localhost (Linux)

## Links uteis
- https://skupper.io/docs/cli/index.html#link-cost

## Bugs encontrados
- Bind no MacOS não está funcionando
- Bind no linux não funciona com host.docker.internal, mas funciona com o localhost