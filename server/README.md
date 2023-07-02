
# Rotas da API

Documentando o básico das rotas do domínio
```https
  https://menu-caviar.000webhostapp.com/
```

## Documentação da API

#### Retorna todos os itens cadastrados

```http
  GET /read.php/${tabela}
```
Substituir {tabela} pelo nome da tabela.

#### Adicionar um Usuário

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

#### Adicionar uma Categoria

```http
  POST /add.php/categorias/${parametros}
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `int` | **Obrigatório**|
| `nome`      | `string` | **Obrigatório**|
