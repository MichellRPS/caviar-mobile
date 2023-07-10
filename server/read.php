<?php
include_once "connection.php";

$route = $_SERVER['REQUEST_URI'];

if ($route === '/read.php/categorias') {
    $statement = $pdo->query('SELECT * FROM categorias;');
    $response = array();

    while ($result = $statement->fetch(PDO::FETCH_ASSOC)) {
        $categorias = array(
            'id' => $result["id"],
            'nome' => $result["nome"],
        );
        $response[] = $categorias;
    }

    header('Content-Type: application/json');
    echo json_encode($response);
} 

if ($route === '/read.php/clientes') {
    $statement = $pdo->query('SELECT * FROM clientes;');
    $response = array();

    while ($result = $statement->fetch(PDO::FETCH_ASSOC)) {
        $clientes = array(
            'id' => $result["id"],
            'nome' => $result["nome"],
            'sobrenome' => $result["sobrenome"],
            'email' => $result["email"],
            'senha' => $result["senha"],
            'cpf' => $result["cpf"],
            'data_nascimento' => $result["data_nascimento"],
            'celular' => $result["celular"]
        );
        $response[] = $clientes;
    }

    header('Content-Type: application/json');
    echo json_encode($response);
} 

if ($route === '/read.php/funcionarios') {
    
    $statement = $pdo->query('SELECT * FROM funcionarios;');
    $response = array();

    while ($result = $statement->fetch(PDO::FETCH_ASSOC)) {
        $funcionarios = array(
            'id' => $result["id"],
            'nome' => $result["nome"],
            'sobrenome' => $result["sobrenome"],
            'email' => $result["email"],
            'senha' => $result["senha"],
            'cpf' => $result["cpf"],
            'data_nascimento' => $result["data_nascimento"],
            'celular' => $result["celular"]
        );
        $response[] = $funcionarios;
    }

    header('Content-Type: application/json');
    echo json_encode($response);
} 

if ($route === '/read.php/produtos') {
    
    $statement = $pdo->query('SELECT * FROM produtos;');
    $response = array();

    while ($result = $statement->fetch(PDO::FETCH_ASSOC)) {
        $produtos = array(
            'id' => $result["id"],
            'id_categoria' => $result["id_categoria"],
            'nome' => $result["nome"],
            'descricao' => $result["descricao"],
            'imagem' => $result["imagem"],//vamos inserir o caminho da imagem? nesse caso precisamos criar outro script para buscar a imagem.
            'preco_unitario' => $result["preco_unitario"]
        );
        $response[] = $produtos;
    }

    header('Content-Type: application/json');
    echo json_encode($response);
}  

try {
    if ($route === '/read.php/enderecos_clientes') {

        $statement = $pdo->prepare('SELECT * FROM enderecos_clientes WHERE id_cliente = :id_cliente;');
        $statement->bindValue(':id_cliente', $_POST['id_cliente']);
        $response = array();

        $statement->execute();

        while ($result = $statement->fetch(PDO::FETCH_ASSOC)) {
            $enderecos_clientes = array(
                'id' => $result["id"],
                'id_cliente' => $result["id_cliente"],
                'id_cidade' => $result["id_cidade"],
                'nome' => $result["nome"],
                'bairro' => $result["bairro"],
                'cep' => $result["cep"],
                'endereco' => $result["endereco"],
                'numero' => $result["numero"]
            );
            $response[] = $enderecos_clientes;
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

if ($route === '/read.php/cidades') {
    $statement = $pdo->query('SELECT * FROM cidades;');
    $response = array();

    while ($result = $statement->fetch(PDO::FETCH_ASSOC)) {
        $cidades = array(
            'id' => $result["id"],
            'id_estado' => $result["id_estado"],
            'nome' => $result["nome"]
        );
        $response[] = $cidades;
    }

    header('Content-Type: application/json');
    echo json_encode($response);
} 

// curl -X POST -d "id_estado=13" https://menu-caviar.000webhostapp.com/read.php/cidades/estado
if ($route === '/read.php/cidades/estado' && $_SERVER['REQUEST_METHOD'] === 'POST') {

    $statement = $pdo->prepare('SELECT * FROM cidades WHERE id_estado = :id_estado;');
    $statement->bindValue(':id_estado', $_POST['id_estado']);
    
    $response = array();

    if ($statement->execute()) {
        while ($result = $statement->fetch(PDO::FETCH_ASSOC)) {
            $cidades = array(
                'id' => $result["id"],
                'nome' => $result["nome"]
            );
            $response[] = $cidades;
        }
    }

    header('Content-Type: application/json');
    echo json_encode($response);
} 

?>
 

