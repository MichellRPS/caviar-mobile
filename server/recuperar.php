<?php 
			include("../connection/conexao.php");
			$setEmail = $_POST["email"];
			$setEmailRecuperacao = $_POST["emailRecuperacao"];
			$codigo = $_POST["codigo"];
			
			$sql = "SELECT * FROM cliente WHERE email = '$setEmail' || emailRecuperacao = '$setEmailRecuperacao'";
			$res = $con->query($sql);
			$linha = $res->fetch_assoc();
			$email = $linha["email"];
			$emailRecuperacao = $linha["emailRecuperacao"];
			
		if($email == $setEmail && $emailRecuperacao == $setEmailRecuperacao){
			$sql2 = "UPDATE cliente SET codigo = '$codigo' WHERE emailRecuperacao = '$setEmailRecuperacao'";
			$con->query($sql2);
			$to = $emailRecuperacao;
			$su = "Codigo para a Recuperaçao da Senha";
			$mensagem = "
		    	<!DOCTYPE html>
		    	<html>
		        <body>
		                <p style='text-align: center'>Nao compartilhe este código</p>
		                <h1 style='text-align: center;'>$codigo</h1>
		                <p style='text-align: center'>Copie este código para recuperar sua senha</p>
		        </body>
		    	</html>
		    	";
		$headers = 'MIME-Version: 1.0'."\r\n";
		$headers .= 'Content-type: text/html; charset=iso-8859-1'."\r\n";
		$headers .= 'From: hamburgueriaHw@webhost.com';
			
		mail($to, $su, $mensagem, $headers);
			header("location: recuperaSenha.php?isEmail=$setEmail&isEmailRecuperacao=$setEmailRecuperacao");
		}else if($email != $setEmail && $emailRecuperacao != $setEmailRecuperacao){
			header("location: recuperaSenha.php?email=$setEmail&emailRecuperacao=$setEmailRecuperacao");
		}else if($email != $setEmail){
			header("location: recuperaSenha.php?emailRecuperacao=$setEmailRecuperacao");
		}else if($emailRecuperacao != $setEmailRecuperacao){							
			header("location: recuperaSenha.php?email=$setEmail");
		}
$con->close();
?>