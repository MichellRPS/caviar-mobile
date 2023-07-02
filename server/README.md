
# Rotas da API

Documentando o básico das rotas do domínio
```https
  https://menu-caviar.000webhostapp.com/
```

## Documentação da API

### Retorna todos os itens cadastrados

```http
  GET /read.php/${tabela}
```
Substituir {tabela} pelo nome da tabela.

Com excessão da tabela enderecos_clientes:

```http
  POST /read.php/enderecos_clientes?id_cliente=${parametros}
```

### Inclusão de dados na tabela

#### Usuário

```http
  POST /add.php/{funcionarios ou clientes}/${parametros}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `int` | **Obrigatório**|
| `nome`      | `string` | **Obrigatório**|
| `sobrenome`      | `string` | **Obrigatório**|
| `email`      | `string` | **Obrigatório**|
| `senha`      | `string` | **Obrigatório**|
| `cpf`      | `string` | **Obrigatório**|
| `data_nascimento`      | `date` | **Obrigatório**|
| `celular`      | `string` | **Obrigatório**|

#### Categoria

```http
  POST /add.php/categorias/${parametros}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `int` | **Obrigatório**|
| `nome`      | `string` | **Obrigatório**|

#### Produto

```http
  POST /add.php/produtos/${parametros}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id_categoria`      | `int` | **Obrigatório**|
| `nome`      | `string` | **Obrigatório**|
| `descricao`      | `string` | **Obrigatório**|
| `imagem`      | `string` | **Obrigatório**|
| `preco_unitario`      | `decimal(10,2)` | **Obrigatório**|

#### Endereços de Clientes

```http
  POST /add.php/produtos/${parametros}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id_cliente`      | `int` | **Obrigatório**|
| `id_cidade`      | `int` | **Obrigatório**|
| `nome`      | `string` | **Obrigatório**|
| `bairro`      | `string` | **Obrigatório**|
| `cep`      | `string(8)` | **Obrigatório**|
| `endereco`      | `string` | **Obrigatório**|
| `numero`      | `int` | **Obrigatório**|

### Atualização de dados na tabela

Segue os mesmos parâmetros da inclusão, com excessão da inclusão do id da tupla referenciada ao final da requisição. Exemplo:

#### Produto

```http
  POST /add.php/produtos/${parametros}&id=${parametros}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id_categoria`      | `int` | **Obrigatório**|
| `nome`      | `string` | **Obrigatório**|
| `descricao`      | `string` | **Obrigatório**|
| `imagem`      | `string` | **Obrigatório**|
| `preco_unitario`      | `decimal(10,2)` | **Obrigatório**|

### Exclusão de dados na tabela

Basta incluir o id da tupla na requisição.

#### Produto

```http
  POST /delete.php/produtos/id=${parametros}
```

### Autenticação das credenciais de acesso

#### Exemplo

```http
  POST /auth.php/${parametros}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `e-mail`      | `string` | **Obrigatório**|
| `senha`      | `string` | **Obrigatório**|

O retorno deve ser: 

```json
{
"status":"success",
"tipo":"cliente"
}
```

onde o ```tipo: [cliente] ou [funcionario]```

ou 

```json
{
"status":"error",
"message":"Email ou senha inv\u00e1lidos"
}
```
