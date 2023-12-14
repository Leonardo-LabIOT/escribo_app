# Escribo Reader_App

A new Flutter project - Aplicativo desenvolvido como parte de processo seletivo da Escribo.

## Como Testar

Para testar o aplicativo, siga os passos abaixo:

1. Vá até a seção de [Releases](https://github.com/Leonardo-LabIOT/escribo_app/releases/tag/Escribo_Latest) no GitHub.
2. Faça o download do arquivo APK mais recente.

## Funcionalidades Principais

- *Acesso aos Favoritos*: Para visualizar os itens marcados como favoritos, clique na estrela no canto superior direito da tela.

- *Leitura do Livro*: Clique no card do livro desejado para iniciar a leitura. Em alguns dispositivos, pode ser necessário conceder permissões de armazenamento de dados.

- *Gerenciar Favoritos*: Adicione ou remova itens da lista de favoritos clicando na estrela.

- *Navegação Intuitiva*: A leitura dos livros é realizada por padrão através de gestos de arrastar para os lados.

## Notas Importantes

- Certifique-se de conceder as permissões necessárias para armazenamento de dados, em caso de falha.

- A persistência da lista de favoritos é mantida localmente por enquanto, com planos de migração para o Firebase em futuras atualizações.

## Version Details

Flutter 3.16.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b0366e0a3f • 2023-12-05 19:46:39 -0800
Engine • revision 54a7145303
Tools • Dart 3.2.3 • DevTools 2.28.4

## Proximos Passos

1. Testes em mais dispositivos,
2. Arrastar para navegar,
3. Mellhorias no Layout,
4. Melhorias na UI,
5. Integrar ao Firebase,
6. Adaptar para IOS,

## Contribuição

Se encontrar algum problema ou tiver sugestões para melhorar o aplicativo, sinta-se à vontade para abrir uma [issue](https://github.com/Leonardo-LabIOT/escribo_app/issues).

## Bugs Relatados e em correção:

1. Autorização em tempo de execução deixou de funcionar.
2. Tela de Favoritos caso não tenha nenhum perde a formatação(envolver com Scafold).(Resolvido)
