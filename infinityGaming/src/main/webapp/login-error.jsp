<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login-Error</title>
		<style type="text/css">
			
			*{
        		margin: 0;
        		padding: 0;
        		box-sizing: border-box;
        		font-family: "Poppins", sans-serif;
        	}
        	
        	body{
        		display: flex;
        		justify-content: center;
        		align-items: center;
        		min-height: 100vh;
        		background: url('./images/Background.jpg');
        	}
        	
        	.wrapper{
        		margin-top: 100px;
        		width: 420px;
        		background: black;
        		color: #fff;
        		border-radius: 10px;
        		padding: 30px 40px;
        	}
        	
        	.img{
        		position: absolute;
			    top: 20px;
			    left: 50%;
			    transform: translateX(-50%);
			    height: 250px;
        	}
			
			a{
        		margin-left: 135px;
        		text-decoration: none;
        		color: #fff;
        	}
        	
        	a:hover{
        		color: #adaaaa;
        	}
        	
        	p{
        		color: red;
        		font-size: 36px;
        		text-align: center;
        	}
		</style>
	</head>
	<body>
	<img class="img" src="./images/logo.png" alt="Infinity Logo">
		<div class="wrapper">
			<p>Credenziali Errate!</p>
			<br>
			<a href="login">Riprova</a>
		</div>
	</body>
</html>