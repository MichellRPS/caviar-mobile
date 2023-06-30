<?php
include_once "connection.php";

$route = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

if ($route === '/add.php/categorias') {
    
    $statement = $pdo->prepare("INSERT INTO categorias (nome) VALUES (:nome);");
    $statement->bindValue(':nome', $_GET['nome']);

    $response = array();

   if ($statement->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'Categoria adicionada com sucesso.';
        $response['categoria'] = array(
            'nome' => $_GET['nome'],
        );
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Erro ao adicionar a categoria.';
    }
     
    header('Content-Type: application/json');
    echo json_encode($response);
}

if ($route === '/add.php/clientes') {
    
    $statement = $pdo->prepare("INSERT INTO clientes (nome,sobrenome,email,senha,cpf,data_nascimento,celular) 
    VALUES (:nome,:sobrenome,:email,:senha,:cpf,:data_nascimento,:celular);");
    $statement->bindValue(':nome', $_GET['nome']);
    $statement->bindValue(':sobrenome', $_GET['sobrenome']);
    $statement->bindValue(':email', $_GET['email']);
    $statement->bindValue(':senha', $_GET['senha']);
    $statement->bindValue(':cpf', $_GET['cpf']);
    $statement->bindValue(':data_nascimento', $_GET['data_nascimento']);
    $statement->bindValue(':celular', $_GET['celular']);
    
    $response = array();

   if ($statement->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'Categoria adicionada com sucesso.';
        $response['cliente'] = array(
            'nome' => $_GET['nome'],
            'sobrenome' => $_GET['sobrenome'],
            'email' => $_GET['email'],
            'senha' => $_GET['senha'],
            'cpf' => $_GET['cpf'],
            'data_nascimento' => $_GET['data_nascimento'],
            'celular' => $_GET['celular'],
        );
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Erro ao adicionar o cliente.';
    }
     
    header('Content-Type: application/json');
    echo json_encode($response);
}

//https://menu-caviar.000webhostapp.com/add.php/funcionarios?nome=carlos&sobrenome=nascimento&email=nascimento@gmail.com&senha=5050&cpf=15645688498&data_nascimento=1980-06-14&celular=1798563264
if ($route === '/add.php/funcionarios') {
    
    $statement = $pdo->prepare("INSERT INTO funcionarios (nome,sobrenome,email,senha,cpf,data_nascimento,celular) 
    VALUES (:nome,:sobrenome,:email,:senha,:cpf,:data_nascimento,:celular);");
    $statement->bindValue(':nome', $_GET['nome']);
    $statement->bindValue(':sobrenome', $_GET['sobrenome']);
    $statement->bindValue(':email', $_GET['email']);
    $statement->bindValue(':senha', $_GET['senha']);
    $statement->bindValue(':cpf', $_GET['cpf']);
    $statement->bindValue(':data_nascimento', $_GET['data_nascimento']);
    $statement->bindValue(':celular', $_GET['celular']);
    
    $response = array();

   if ($statement->execute()) {
        $response['status'] = 'success';
        $response['message'] = 'Categoria adicionada com sucesso.';
        $response['funcionario'] = array(
            'nome' => $_GET['nome'],
            'sobrenome' => $_GET['sobrenome'],
            'email' => $_GET['email'],
            'senha' => $_GET['senha'],
            'cpf' => $_GET['cpf'],
            'data_nascimento' => $_GET['data_nascimento'],
            'celular' => $_GET['celular'],
        );
    } else {
        $response['status'] = 'error';
        $response['message'] = 'Erro ao adicionar o funcionário.';
    }
     
    header('Content-Type: application/json');
    echo json_encode($response);
}