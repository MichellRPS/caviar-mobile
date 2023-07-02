<?php
include_once "connection.php";

$route = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

try {
    if ($route === '/add.php/categorias') {

        $statement = $pdo->prepare("INSERT INTO categorias (nome) VALUES (:nome);");
        
        $statement->bindValue(':nome', $_POST['nome']);

        $response = array();

        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Categoria adicionada com sucesso.';
            $response['categoria'] = array(
                'nome' => $_POST['nome'],
            );
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao adicionar a categoria.';
        }

        header('Content-Type: application/json');
        echo json_encode($response);
    }
} catch (PDOException $e) {
    $response = array(
        'status' => 'error',
        'message' => 'Erro ao conectar ao banco de dados: ' . $e->getMessage()
    );
    
    header('Content-Type: application/json');
    echo json_encode($response);
}

try {

    if ($route === '/add.php/clientes') {
        
        $statement = $pdo->prepare("INSERT INTO clientes (nome,sobrenome,email,senha,cpf,data_nascimento,celular) 
        VALUES (:nome,:sobrenome,:email,:senha,:cpf,:data_nascimento,:celular);");
        
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':sobrenome', $_POST['sobrenome']);
        $statement->bindValue(':email', $_POST['email']);
        $statement->bindValue(':senha', $_POST['senha']);
        $statement->bindValue(':cpf', $_POST['cpf']);
        $statement->bindValue(':data_nascimento', $_POST['data_nascimento']);
        $statement->bindValue(':celular', $_POST['celular']);
        
        $response = array();
    
       if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Cliente adicionado com sucesso.';
            $response['cliente'] = array(
                'nome' => $_POST['nome'],
                'sobrenome' => $_POST['sobrenome'],
                'email' => $_POST['email'],
                'senha' => $_POST['senha'],
                'cpf' => $_POST['cpf'],
                'data_nascimento' => $_POST['data_nascimento'],
                'celular' => $_POST['celular'],
            );
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao adicionar o cliente.';
        }
         
        header('Content-Type: application/json');
        echo json_encode($response);
    }
}catch (PDOException $e) {
    $response = array(
        'status' => 'error',
        'message' => 'Erro ao conectar ao banco de dados: ' . $e->getMessage()
    );
    
    header('Content-Type: application/json');
    echo json_encode($response);
}

//https://menu-caviar.000webhostapp.com/add.php/funcionarios?nome=carlos&sobrenome=nascimento&email=nascimento@gmail.com&senha=5050&cpf=15645688498&data_nascimento=1980-06-14&celular=1798563264
try{
    if ($route === '/add.php/funcionarios') {
        
        $statement = $pdo->prepare("INSERT INTO funcionarios (nome,sobrenome,email,senha,cpf,data_nascimento,celular) 
        VALUES (:nome,:sobrenome,:email,:senha,:cpf,:data_nascimento,:celular);");
        
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':sobrenome', $_POST['sobrenome']);
        $statement->bindValue(':email', $_POST['email']);
        $statement->bindValue(':senha', $_POST['senha']);
        $statement->bindValue(':cpf', $_POST['cpf']);
        $statement->bindValue(':data_nascimento', $_POST['data_nascimento']);
        $statement->bindValue(':celular', $_POST['celular']);
        
        $response = array();
    
       if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Categoria adicionada com sucesso.';
            $response['funcionario'] = array(
                'nome' => $_POST['nome'],
                'sobrenome' => $_POST['sobrenome'],
                'email' => $_POST['email'],
                'senha' => $_POST['senha'],
                'cpf' => $_POST['cpf'],
                'data_nascimento' => $_POST['data_nascimento'],
                'celular' => $_POST['celular'],
            );
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao adicionar a categoria.';
        }
         
        header('Content-Type: application/json');
        echo json_encode($response);
        
        header('Content-Type: application/json');
        echo json_encode($response);
    }
} catch (PDOException $e) {
    $response = array(
        'status' => 'error',
        'message' => 'Erro ao conectar ao banco de dados: ' . $e->getMessage()
    );
}

try{
    if ($route === '/add.php/produtos') {
        
        $statement = $pdo->prepare("INSERT INTO produtos (id_categoria,nome,descricao,imagem,preco_unitario) 
        VALUES (:id_categoria,:nome,:descricao,:imagem,:preco_unitario);");
        
        $statement->bindValue(':id_categoria', $_POST['id_categoria']);
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':descricao', $_POST['descricao']);
        $statement->bindValue(':imagem', $_POST['imagem']);
        $statement->bindValue(':preco_unitario', $_POST['preco_unitario']);
        
        $response = array();
    
       if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Produto adicionado com sucesso.';
            $response['produto'] = array(
                'id_categoria' => $_POST['id_categoria'],
                'nome' => $_POST['nome'],
                'descricao' => $_POST['descricao'],
                'imagem' => $_POST['imagem'],
                'preco_unitario' => $_POST['preco_unitario'],
            );
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao adicionar o produto.';
        }
         
        header('Content-Type: application/json');
        echo json_encode($response);
    }
} catch (PDOException $e) {
    $response = array(
        'status' => 'error',
        'message' => 'Erro ao conectar ao banco de dados: ' . $e->getMessage()
    );
    
    header('Content-Type: application/json');
    echo json_encode($response);
}

try{
    if ($route === '/add.php/enderecos_clientes') {
        
        $statement = $pdo->prepare("INSERT INTO enderecos_clientes (id_cliente,id_cidade,nome,bairro,cep,endereco,numero) 
        VALUES (:id_cliente,:id_cidade,:nome,:bairro,:cep,:endereco,:numero);");
        
        $statement->bindValue(':id_cliente', $_POST['id_cliente']);
        $statement->bindValue(':id_cidade', $_POST['id_cidade']);
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':bairro', $_POST['bairro']);
        $statement->bindValue(':cep', $_POST['cep']);
        $statement->bindValue(':endereco', $_POST['endereco']);
        $statement->bindValue(':numero', $_POST['numero']);
        
        $response = array();
    
       if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Endereço adicionado com sucesso.';
            $response['endereco_cliente'] = array(
                'id_cliente' => $_POST['id_cliente'],
                'id_cidade' => $_POST['id_cidade'],
                'nome' => $_POST['nome'],
                'bairro' => $_POST['bairro'],
                'cep' => $_POST['cep'],
                'endereco' => $_POST['endereco'],
                'numero' => $_POST['numero']
            );
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao adicionar o Endereço.';
        }
         
        header('Content-Type: application/json');
        echo json_encode($response);
    }
} catch (PDOException $e) {
    $response = array(
        'status' => 'error',
        'message' => 'Erro ao conectar ao banco de dados: ' . $e->getMessage()
    );
    
    header('Content-Type: application/json');
    echo json_encode($response);
}