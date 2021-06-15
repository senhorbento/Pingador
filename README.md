# ip_tester

Um simples Shell script que identifica, dado uma lista de ips, quais dispositivos estão ligados no momento.

O script utiliza a ferramenta ping do próprio linux para fazer a validação se o equipamento está ligado, logo se o equipamento não tiver o ping habilitado constará como desligado.  
Utiliza regex para identificar os ips na lista e dentro do ping se houve ou não packet loss.

## Modo de utilizar:

Crie uma lista de ips como no exemplo a seguir, e indique ela após a inicialização do script.

### Exemplo de lista:

192.168.5.1  
127.0.0.1  
8.8.8.8  
...  
