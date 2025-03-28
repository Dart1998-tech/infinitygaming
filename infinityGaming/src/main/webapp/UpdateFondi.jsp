<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>UodateFondi</title>
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
        	
        	.fondi input{
        		border: none;
        		accent-color: #fff;
        		margin-right: 3px;
        		margin-left: 15px;
        		margin: 2px;
        	}
        	
        	.wrapper .fondi input{
        		width: 100%;
        		heigth: 100%;
        		background: #fff;
        		outline: none;
        		border-radius: 40px;
        		box-shadows: 0 0 10px rgba(0, 0, 0, .1);
        		border-color: black;
        		cursor: pointer;
        		font-size: 30px;
        		color: #333;
        		font-weigth: 700px;
        		margin-down: 5px;
        	}
        	
        	.wrapper .fondi input:hover{
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
        	
        	.aggiungi input{
        		border: none;
        		accent-color: #fff;
        		margin-left: 90px;
        	}
        	
        	.wrapper .aggiungi input{
        		width: 50%;
        		heigth:	50%;
        		background: #fff;
        		outline: none;
        		border-radius: 40px;
        		box-shadows: 0 0 10px rgba(0, 0, 0, .1);
        		border-color: black;
        		cursor: pointer;
        		font-size: 30px;
        		color: #333;
        		font-weigth: 500px;
        	}
        	
        	.wrapper .aggiungi input:hover{
				background: #adaaaa;
				color: #fff;
        	}
        	
		</style>
	</head>
	<body>
	<img class="img" src="./images/logo.png" alt="Infinity Logo">
		<div class="wrapper">
		<form>
		<h1>Aggiungi Fondi</h1>
			<div class="input-box">
				<input type="text" name="fondi" value="" readonly/>
			</div>
			<div class="fondi">
				<input type="submit" value="+ 50€" />
				<input type="submit" value="+ 100€" />
				<input type="submit" value="+ 200€" />
			</div>
			<br>
			<div class="aggiungi">
				<input type="submit" value="Aggiungi" />
			</div>
		</form>
		</div>
	</body>
</html>
