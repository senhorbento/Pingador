# TrabalhoLFT

8) Teste de Ping:
- o Script deve receber como parâmetro um arquivo contendo uma lista com os endereços ipv4
que devem ser testados. Caso não seja passa do parâmetro e deve ser solicitado ao utilizador um
arquivo. Testar se o parâmetro indicado é realmente um arquivo, caso contrario essa informação
deve ser apresentada ao utilizador e outro arquivo deve ser pedido no máximo 3 vezes antes de
terminar o programa.
Antes de realizar o ping o script deve verificar se a linha do arquivo que ira testar tem o formato
de um endereço ipv4. (Dica Usar Regex)
- o comando utilizado para testar o ipv4 é: ping -c 1 endereço_ipv4.
- sempre que o comando retorna dentro da String de resposta o texto '100% packt loss' podem
considerar que o teste falhou.
- o script deve criar um arquivo designado Resultados_teste.txt contendo a seguinte informação
- A) quantidade e lista de endereços ativos
- B) quantidade e lista de endereços inativos
- C) quantidade e lista de endereços inválidos

<a href=“http://gamon.webfactional.com/regexnumericrangegenerator/“>Regex Numeric Range Generator</a>
