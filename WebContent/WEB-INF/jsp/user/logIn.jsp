<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Log In</title>
		<style type="text/css">
			html, body {
				height:100%; 
				margin:0;
				padding:0;
				text-align:left;
				text-decoration:none;
				display:inline;
				border:none;
				font-size: 1.1em;
				font-family: Verdana, Arial, Helvetica, sans-serif;
			}
			#page-background {position:fixed; top:0; left:0; width:100%; height:100%;}
			#content {position:relative; z-index:1; padding:10px;}

			
			div.wrap {
				height:100%
				width:100%
			}

			.myTable {
				padding-top: 100px; 
				padding-left:150px;
			}

			.box_wrapper {
				background-image:url(../images/logInDivImage.jpg);
				background-position:center;
				background-repeat:no-repeat;
				width:600px; height:360px; margin:auto; margin-top: 190px;
			}

			input {
				font-family: "Lucida Grande",Verdana,sans-serif;
				font-size:18px;
				border: 1px solid #999999;
			}

			input.textboxes {
				width:200px;
				background-color:#ffffff;
			}

			input.btn {
				color:#0000c0;
				border: 1px solid #999999;
			}

			div.labels {
				width:400px;
				color:#0000c0;
			}
			mandatory{
				color:red;
			}
		</style>
		<script type="text/javascript">
			function submitLogIn(){
				//code to submit the page
				document.forms[0].action="LogIn.htm";
				document.forms[0].submit();
			}
		</script>
	</head>
	<body>
        <div id="page-background">
            <img src="../images/logInImage.jpg" width="100%" height="100%" alt="Smile">
        </div>
        <div id="content">
            <div class="wrap">
                <div class="box_wrapper">
                    <form:form method="POST" commandName="userForm">
						<table class="myTable" cellpadding="5" cellspacing="10%" >
							<tr>
								<td>
									<labelfor="name">User Name:</label>
									<label class="mandatory">*</label>
								</td>
								<td>
									<form:input path="name" cssClass="textboxes" id="name" /><form:errors path="name" />
								</td>
							</tr>
							<tr>
								<td>
								    <label for="password">Password:</label>
									<label class="mandatory">*</label>
								</td>
								<td>
									<form:password path="password" cssClass="textboxes" id="psw" /><form:errors path="password" />
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									<input class="btn" value="Submit" type="submit" onclick="javascript:submitLogIn()" />
								</td>
							</tr>
						</table>		
		            </form:form>
				</div>
		    </div>
		</div>
	</body>
</html>