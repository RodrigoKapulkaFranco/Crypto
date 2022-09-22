# cripto  

## Card 2

Projeto de uma página de uma carteira de cripto moedas. Ao clicar no ícone de um olho os valores monetários devem ficar borrados. O Widget em baixo é uma bottonNavigationBar, que faz uma navegação para uma página ainda não implementada. 

### Bônus: Navegação implementada. 

## Card 3

Foi realizada a extração de diversos widgets do projeto. Também houve a implementaçõa do package hooks_riverpod para facilitar a extração. Também foram implementados testes simples para averiguar a navegação e se o ícone para ocultar as informações está funcionando. 

### Bônus: Testes para verificar a navegação e a funcionalidade de ocultar as informações. 

## Card 4

Substituição da navegação por índice para navegação por rotas nomeadas, e também refatoração da estrutura de pastas.

### Bônus: Testes adaptados para testar a nova navegação.

## Card 5

Adicionada uma página de detalhes para cada criptomoeda. A navegação para esta nova página ocorre por rotas nomeadas. Na nova página foi implementado um gráfico de linhas utilizando o package indicado (fl_chart). O botão de converter moedas está presente apesar de que quando clicado não realiza nenhuma ação.

### Bônus: Foram adicionados mais testes, para averiguar a navegação para a página de detalhes.

## Card 6

Foi implementado a requisição de API (coingecko), todos as páginas (com exceção das extras e não implementadas) estão realizando requisições. A lista de cripto moedas vem por requisição (Sempre as mesmas moedas) e os dados do gráfico também. Nesse card foi utilizado os pacotes DIO, Build runner e JsonSerialization. Também houve uma refatoração na arquitetura do projeto para se assemelhar mais ao exemplo dado no card 3.

### Bônus: Foi adicionada uma splash screen com animações de opacidade ao projeto e também foram adicionadas novas cripto moedas a tela de portfólio.

## Link do figma: https://www.figma.com/file/aB3rbJ4RaCxBnG3SOCalgQ/Desafio-de-Flutter?node-id=0%3A1
