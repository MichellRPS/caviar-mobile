<?php
include_once "connection.php";

$route = $_SERVER['REQUEST_URI'];

function autenticar($email, $senha) {
    global $pdo;

    $statement = $pdo->prepare('SELECT * FROM clientes WHERE email = :email AND senha = :senha');
    $statement->bindValue(':email', $email);
    $statement->bindValue(':senha', $senha);
    $statement->execute();
    $cliente = $statement->fetch(PDO::FETCH_ASSOC);

    if ($cliente) {
        $cliente['tipo'] = 'cliente';
        return $cliente;
    }

    $statement = $pdo->prepare('SELECT * FROM funcionarios WHERE email = :email AND senha = :senha');
    $statement->bindValue(':email', $email);
    $statement->bindValue(':senha', $senha);
    $statement->execute();
    $funcionario = $statement->fetch(PDO::FETCH_ASSOC);

    if ($funcionario) {
        $funcionario['tipo'] = 'funcionario';
        return $funcionario;
    }

    return false;
}

// Rota de autenticação de usuário
// curl -X POST -d "email=vanessa@gmail.com&senha=8890" https://menu-caviar.000webhostapp.com/auth.php/login
if ($route === '/auth.php/login') {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
        $senha = $_POST['senha'];

        $user = autenticar($email, $senha);

        if ($user) {
            $response = array('status' => 'success', 'tipo' => $user['tipo']);
        } else {
            $response = array('status' => 'error', 'message' => 'Email ou senha inválidos');
        }

        header('Content-Type: application/json');
        echo json_encode($response);
    }
}

?>
