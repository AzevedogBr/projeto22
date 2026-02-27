# Rock Encantech — Números Perfeitos

App desenvolvido em Flutter como parte de um teste técnico. A proposta era simples: criar uma interface mobile para trabalhar com números perfeitos.

## Como rodar

Você precisa ter o Flutter instalado. Depois, basta clonar o repositório e rodar:

```bash
flutter pub get
flutter run
```

## Fluxo do app

O app abre com uma splash de 3 segundos e redireciona para a tela de login.

### Login

O login é fake — não há validação de senha. Qualquer senha serve. O único campo obrigatório é o e-mail (o campo não pode estar vazio). Use qualquer combinação, por exemplo:

```
E-mail: teste@rock.com
Senha: 123
```

Isso é suficiente para acessar o app. A ideia era focar no problema principal, não em autenticação.

### Números Perfeitos

Um número perfeito é aquele cuja soma dos seus divisores próprios (ou seja, todos os divisores, excluindo ele mesmo) é igual ao próprio número.

O exemplo mais clássico é o **6**: seus divisores são 1, 2 e 3, e 1 + 2 + 3 = 6.

Os quatro primeiros números perfeitos são: **6, 28, 496 e 8128**.

O app oferece duas funcionalidades:

**1. Verificar um número**
Digite qualquer número inteiro e o app diz se ele é perfeito ou não. Se não for, um ícone de informação aparece com uma explicação rápida do conceito.

**2. Buscar em um intervalo**
Informe um número inicial e um final. O app retorna todos os números perfeitos encontrados nesse intervalo. Para testar, um bom intervalo é `1` até `10000` — você vai encontrar 6, 28, 496 e 8128.

## Arquitetura

Flutter com Cubit (flutter_bloc) para gerenciamento de estado. A estrutura segue o padrão de separação por feature, com widgets independentes que não conhecem a camada de estado — apenas recebem dados e disparam callbacks.

```
lib/
├── core/routes/
├── domain/services/        ← lógica pura (PerfectNumberService)
└── presentation/
    ├── splash/
    ├── login/
    └── home/
        ├── bloc/           ← HomeCubit + HomeState
        ├── pages/          ← orquestra o estado
        └── widgets/        ← componentes visuais independentes
```

O algoritmo de verificação usa a abordagem O(√n): em vez de iterar até `n - 1`, vai até a raiz quadrada de `n` e já coleta o par de divisores em cada passo. Isso torna a busca em intervalos grandes bem mais rápida.
