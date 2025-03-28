<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
		<title>Registrazione</title>
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
        		margin-top: 280px;
        		width: 420px;
        		background: black;
        		color: #fff;
        		border-radius: 10px;
        		padding: 30px 40px;
        	}
        	
        	.wrapper h1{
        		font-size: 36px;
        		text-align: center;
        	}
        	
        	.wrapper .input-box{
        		position: relative;
        		width: 100%;
        		height: 50px;
        		margin: 30px 0;
        	}
        	
        	.input-box input{
        		width: 100%;
        		height: 100%;
        		background: transparent;
        		border: none;
        		outline: nome;
        		border: 2px solid rgba(255, 255, 255, .2);
        		border-radius: 40px;
        		font-size: 16px;
        		color: #fff;
        		padding: 20px 45px 20px 20px;
        	}
        	
        	.input-box input::placeholder{
        		color: #fff;
        	}
        	
        	.wrapper .new-user{
        		display: flex;
        		justify-content: space-between;
        		font-size: 14.5px;
        		margin: -15px 0 15px;
        		margin-left: 15px
        	}
        	
        	.login-reset input{
        		border: none;
        		accent-color: #fff;
        		margin-right: 3px;
        		margin-left: 15px;
        		margin: 2px;
        	}
        	
        	.new-user a{
        		margin-left: 135px;
        		text-decoration: none;
        		color: #fff;
        	}
        	
        	.new-user a:hover{
        		color: #adaaaa;
        	}
        	
        	.wrapper .login-reset input{
        		width: 100%;
        		heigth: 100%;
        		background: #fff;
        		outline: none;
        		border-radius: 40px;
        		box-shadows: 0 0 10px rgba(0, 0, 0, .1);
        		cursor: pointer;
        		font-size: 20px;
        		color: #333;
        		font-weigth: 600;
        		margin-down: 5px;
        	}
        	
        	.wrapper .login-reset input:hover{
				background: #adaaaa;
				color: #fff;
        	}
        	
        	.img{
        		position: absolute;
			    top: 20px;
			    left: 50%;
			    transform: translateX(-50%);
			    height: 250px;
        	}
		
		</style>
	</head>
	<body bgcolor="silver">
	<img class="img" src="./images/logo.png" alt="Infinity Logo">
	<div class="wrapper">
		<form method="post" action="userRegistration.jsp">
			<h1>Registrati</h1>
			
			<div class="input-box">
				<input type="text" name="firstName" value="" placeholder="Nome"/>
			</div>
			
			<div class="input-box">
				<input type="text" name="lastName" value="" placeholder="Cognome"/>
			</div>	
	
			<div class="input-box">
				<input type="text" name="email" value="" placeholder="Email"/>
			</div>
			
			<div class="input-box">
				<input type="text" name="userName" value="" placeholder="Username"/>
			</div>
			
			<div class="input-box">
				<input type="password" name="password" value="" placeholder="Password"/>
			</div>
			
			<div class="login-reset">
				<input type="submit" value="Registrati" />
				<br>
				<input type="reset" value="Reset" />
			</div>
			<br>
			<br>
			<div class="new-user">
				<p>Sei già registrato? <a href="index.jsp">Login</a></p>
			</div>
		</form>
	</div>
	</body>
</html>