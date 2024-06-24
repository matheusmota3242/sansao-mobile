# sansao_mobile

Este é um aplicativo desenvolvido em Flutter 3 que se conecta a uma API REST para gerenciar atividades físicas do usuário. O aplicativo utiliza autenticação JWT para garantir a segurança dos dados.

## Descrição

Permite que os usuários:

- Registrem suas atividades físicas diárias.
- Visualizem o histórico de atividades.
- Atualizem e excluam atividades registradas.
- Autentiquem-se de forma segura utilizando JWT.

## Tecnologias Utilizadas

- Flutter 3
- Dart
- API REST
- JWT (JSON Web Token) para autenticação


## Instalação

### Pré-requisitos

- Flutter 3.0.0 ou superior
- Dart 2.15.0 ou superior

### Passo a passo

1. **Clone o repositório**

```bash
git clone https://github.com/seu-usuario/fitness_tracker_app.git
cd sansao_mobile
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute o aplicativo**
```bash
flutter run
```

## Funcionalidades
### Autenticação
- Login e Registro de Usuário: Os usuários podem criar uma conta e fazer login utilizando autenticação JWT para garantir a segurança dos dados.
- Autenticação Firebase: Utilização do Firebase Auth para gerenciamento de autenticação.
### Gerenciamento de Atividades
- Registrar Atividade: Os usuários podem registrar novas atividades físicas, incluindo detalhes como tipo de atividade, duração e data.
- Visualizar Histórico: Os usuários podem visualizar um histórico de suas atividades físicas.
- Atualizar Atividade: Os usuários podem atualizar detalhes de atividades registradas.
- Excluir Atividade: Os usuários podem excluir atividades que não desejam mais manter no histórico.
