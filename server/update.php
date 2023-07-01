<?php
include_once "connection.php";

$route = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

try {
    if ($route === '/update.php/categorias') {

        $statement = $pdo->prepare("UPDATE categorias SET nome = :nome WHERE id = :id;");
        
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':id', $_POST['id']);

        $response = array();

        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Categoria atualizada com sucesso.';
            $response['categoria'] = array(
                'id' => $_POST['id'],
                'nome' => $_POST['nome'],
            );
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao atualizar a categoria.';
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

    if ($route === '/update.php/clientes') {
        
        $statement = $pdo->prepare("UPDATE clientes SET nome = :nome, sobrenome = :sobrenome, email = :email, senha = :senha, cpf = :cpf, data_nascimento = :data_nascimento, celular = :celular WHERE id = :id;");
        
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':sobrenome', $_POST['sobrenome']);
        $statement->bindValue(':email', $_POST['email']);
        $statement->bindValue(':senha', $_POST['senha']);
        $statement->bindValue(':cpf', $_POST['cpf']);
        $statement->bindValue(':data_nascimento', $_POST['data_nascimento']);
        $statement->bindValue(':celular', $_POST['celular']);
        $statement->bindValue(':id', $_POST['id']);
        
        $response = array();
    
        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Cliente atualizado com sucesso.';
            $response['cliente'] = array(
                'id' => $_POST['id'],
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
            $response['message'] = 'Erro ao atualizar o cliente.';
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
    if ($route === '/update.php/funcionarios') {
        
        $statement = $pdo->prepare("UPDATE funcionarios SET nome = :nome, sobrenome = :sobrenome, email = :email, senha = :senha, cpf = :cpf, data_nascimento = :data_nascimento, celular = :celular WHERE id = :id;");
        
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':sobrenome', $_POST['sobrenome']);
        $statement->bindValue(':email', $_POST['email']);
        $statement->bindValue(':senha', $_POST['senha']);
        $statement->bindValue(':cpf', $_POST['cpf']);
        $statement->bindValue(':data_nascimento', $_POST['data_nascimento']);
        $statement->bindValue(':celular', $_POST['celular']);
        $statement->bindValue(':id', $_POST['id']);
        
        $response = array();
    
        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Funcionário atualizado com sucesso.';
            $response['funcionario'] = array(
                'id' => $_POST['id'],
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
            $response['message'] = 'Erro ao atualizar o funcionário.';
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
    if ($route === '/update.php/produtos') {
        
        $statement = $pdo->prepare("UPDATE produtos SET id_categoria = :id_categoria, nome = :nome, descricao = :descricao, imagem = :imagem, preco_unitario = :preco_unitario WHERE id = :id;");
        
        $statement->bindValue(':id_categoria', $_POST['id_categoria']);
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':descricao', $_POST['descricao']);
        $statement->bindValue(':imagem', $_POST['imagem']);
        $statement->bindValue(':preco_unitario', $_POST['preco_unitario']);
        $statement->bindValue(':id', $_POST['id']);
        
        $response = array();
    
        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Produto atualizado com sucesso.';
            $response['produto'] = array(
                'id' => $_POST['id'],
                'id_categoria' => $_POST['id_categoria'],
                'nome' => $_POST['nome'],
                'descricao' => $_POST['descricao'],
                'imagem' => $_POST['imagem'],
                'preco_unitario' => $_POST['preco_unitario'],
            );
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao atualizar o produto.';
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
    if ($route === '/update.php/enderecos_clientes') {
        
        $statement = $pdo->prepare("UPDATE enderecos_clientes SET id_cliente = :id_cliente, id_cidade = :id_cidade, nome = :nome, bairro = :bairro, cep = :cep, endereco = :endereco, numero = :numero WHERE id = :id;");
        
        $statement->bindValue(':id_cliente', $_POST['id_cliente']);
        $statement->bindValue(':id_cidade', $_POST['id_cidade']);
        $statement->bindValue(':nome', $_POST['nome']);
        $statement->bindValue(':bairro', $_POST['bairro']);
        $statement->bindValue(':cep', $_POST['cep']);
        $statement->bindValue(':endereco', $_POST['endereco']);
        $statement->bindValue(':numero', $_POST['numero']);
        $statement->bindValue(':id', $_POST['id']);
        
        $response = array();
    
        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Endereço do cliente atualizado com sucesso.';
            $response['endereco_cliente'] = array(
                'id' => $_POST['id'],
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
            $response['message'] = 'Erro ao atualizar o endereço do cliente.';
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

?>
