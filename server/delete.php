<?php
include_once "connection.php";

$route = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

try {
    if ($route === '/delete.php/categorias') {
        $id = $_GET['id'];
        
        $statement = $pdo->prepare("DELETE FROM categorias WHERE id = :id;");
        $statement->bindValue(':id', $id);
        
        $response = array();

        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Categoria excluída com sucesso.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao excluir a categoria.';
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
    if ($route === '/delete.php/clientes') {
        $id = $_GET['id'];
        
        $statement = $pdo->prepare("DELETE FROM clientes WHERE id = :id;");
        $statement->bindValue(':id', $id);
        
        $response = array();

        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Cliente excluído com sucesso.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao excluir o cliente.';
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
    if ($route === '/delete.php/funcionarios') {
        $id = $_GET['id'];
        
        $statement = $pdo->prepare("DELETE FROM funcionarios WHERE id = :id;");
        $statement->bindValue(':id', $id);
        
        $response = array();

        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Funcionário excluído com sucesso.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao excluir o funcionário.';
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
    if ($route === '/delete.php/produtos') {
        $id = $_GET['id'];
        
        $statement = $pdo->prepare("DELETE FROM produtos WHERE id = :id;");
        $statement->bindValue(':id', $id);
        
        $response = array();

        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Produto excluído com sucesso.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao excluir o produto.';
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
    if ($route === '/delete.php/enderecos_clientes') {
        $id = $_GET['id'];
        
        $statement = $pdo->prepare("DELETE FROM enderecos_clientes WHERE id = :id;");
        $statement->bindValue(':id', $id);
        
        $response = array();

        if ($statement->execute()) {
            $response['status'] = 'success';
            $response['message'] = 'Endereço do cliente excluído com sucesso.';
        } else {
            $response['status'] = 'error';
            $response['message'] = 'Erro ao excluir o endereço do cliente.';
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