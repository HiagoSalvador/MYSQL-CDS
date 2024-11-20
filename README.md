# Desafio - Banco de Dados de CDs

## Introdução
Este projeto consiste na criação de um banco de dados relacional para gerenciar informações relacionadas a uma loja de CDs. Foi desenvolvido como parte de um desafio do Instituto PROA. O objetivo principal é aplicar os conceitos de modelagem e criação de tabelas em SQL.

## Estrutura do Banco de Dados
O banco de dados foi modelado para incluir as seguintes tabelas principais:

### 1. **Artista**
- Gerencia informações sobre os artistas.
- Campos: `id_Artista`, `Cod_Artista`, `Nome_Artista`.

### 2. **Gravadora**
- Armazena informações sobre gravadoras de CDs.
- Campos: `id_Gravadora`, `Cod_Gravadora`, `Nome_Gravadora`.

### 3. **Categoria**
- Define categorias dos CDs.
- Campos: `id_Categoria`, `Cod_Categoria`, `Nome_Categoria`.

### 4. **Estado**
- Registra os estados e suas siglas.
- Campos: `id_Estado`, `Sigla_Estado`, `Nome_Estado`.

### 5. **Cidade**
- Relaciona cidades a estados.
- Campos: `id_Cidade`, `Cod_Cidade`, `Sigla_Estado`, `Nome_Cidade`, `fk_id_Estado`.

### 6. **Cliente**
- Contém informações dos clientes.
- Campos: `id_Cliente`, `Cod_Cli`, `Nome_Cli`, `End_Cli`, `Renda_Cli`, `Sexo_Cli`, `fk_id_Cidade`.

### 7. **Cônjuge**
- Armazena dados sobre os cônjuges dos clientes.
- Campos: `id_Conjuge`, `Cod_Cli`, `Nome_Conj`, `Renda_Conj`, `Sexo_Conj`, `fk_id_Cliente`.

### 8. **Funcionário**
- Detalha os dados dos funcionários.
- Campos: `id_Funcionario`, `Cod_Func`, `Nome_Func`, `End_Func`, `Sal_Func`, `Sexo_Func`.

### 9. **Dependente**
- Relaciona dependentes aos funcionários.
- Campos: `Cod_Dep`, `Cod_Func`, `Nome_Dep`, `Sexo_Dep`, `fk_id_Funcionario`.

### 10. **Título**
- Gerencia os CDs disponíveis para venda.
- Campos: `Cod_Tit`, `Nome_CD`, `Val_CD`, `Qtd_Estq`, `fk_id_Categoria`, `fk_id_Gravadora`.

### 11. **Pedido**
- Armazena informações sobre os pedidos realizados pelos clientes.
- Campos: `id_Pedido`, `Num_Ped`, `Cod_Cli`, `Cod_Func`, `Data_Ped`, `Val_Ped`, `fk_id_Cliente`, `fk_id_Funcionario`.

### 12. **Título Pedido**
- Relaciona os CDs incluídos em um pedido.
- Campos: `id_Pedido`, `Cod_Tit`, `Qtd_CD`, `Val_CD`, `fk_Cod_Tit`.

### 13. **Título Artista**
- Relaciona artistas aos CDs.
- Campos: `id_Titulo_Artista`, `Cod_Artista`, `fk_Cod_Tit`.

## Como Utilizar
1. Execute os comandos SQL no seu ambiente de banco de dados (MySQL).
2. Certifique-se de criar as tabelas na ordem correta para respeitar as restrições de chave estrangeira.
3. Use consultas SQL para inserir, consultar e manipular os dados.

## Conclusão
Este projeto é uma aplicação prática de conceitos de banco de dados, como modelagem relacional, chaves primárias, chaves estrangeiras e restrições. Ele demonstra como estruturar um banco de dados para atender a um cenário real.
