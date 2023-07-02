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
        $usuario = array(
            'tipo' => 'cliente',
            'id' => $cliente["id"],
            'nome' => $cliente["nome"],
            'sobrenome' => $cliente["sobrenome"],
            'email' => $cliente["email"],
            'senha' => $cliente["senha"],
            'cpf' => $cliente["cpf"],
            'data_nascimento' => $cliente["data_nascimento"],
            'celular' => $cliente["celular"]
        );

        return $usuario;
    }

    $statement = $pdo->prepare('SELECT * FROM funcionarios WHERE email = :email AND senha = :senha');
    $statement->bindValue(':email', $email);
    $statement->bindValue(':senha', $senha);
    $statement->execute();
    $funcionario = $statement->fetch(PDO::FETCH_ASSOC);

    if ($funcionario) {
        $usuario = array(
            'tipo' => 'funcionario',
            'id' => $funcionario["id"],
            'nome' => $funcionario["nome"],
            'sobrenome' => $funcionario["sobrenome"],
            'email' => $funcionario["email"],
            'senha' => $funcionario["senha"],
            'cpf' => $funcionario["cpf"],
            'data_nascimento' => $funcionario["data_nascimento"],
            'celular' => $funcionario["celular"]
        );
        return $usuario;
    }

    return false;
}

// Rota de autenticação de usuário
// curl -X POST -d "email=vanessa@gmail.com&senha=8890" https://menu-caviar.000webhostapp.com/auth.php/login
if ($route === '/auth.php/login') {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
        $senha = $_POST['senha'];

        $usuario_autenticado = autenticar($email, $senha);

        if ($usuario_autenticado) {
            $response = array('status' => 'success', 'usuario' => $usuario_autenticado);
        } else {
            $response = array('status' => 'error', 'message' => 'Email ou senha inválidos');
        }

        header('Content-Type: application/json');
        echo json_encode($response);
    }
}

?>
