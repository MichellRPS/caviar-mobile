<?php
/*-------- CONFIGURAÇÕES DO SERVIDOR -------- */
$hostname = 'localhost';
$username = 'id20912323_root';
$password = '@CaviarMobile0';
$database = 'id20912323_caviar';
$sql = "mysql:host={$hostname};dbname={$database};";
$dsn_Options = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION];
/*-------- CONFIGURAÇÕES DO SERVIDOR -------- */

try {
    $pdo = new \PDO($sql, $username, $password, $dsn_Options);
    //echo "Conexão com {$database} realizada com sucesso!";
} catch (PDOException $error) {
    echo 'Erro na conexão: ' . $error->getMessage();
}
