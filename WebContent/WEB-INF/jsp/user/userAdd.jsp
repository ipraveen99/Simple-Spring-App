<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User Add</title>
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

			#content {position:relative; z-index:1; padding:150px;}


			div.wrap {
				height:100%
				width:100%
			}

			.myTable {
				font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
				width:50%;
				border-collapse:collapse;
				margin:auto;
			}
			input {
				font-family: "Lucida Grande",Verdana,sans-serif;
				font-size:18px;
				border: 1px solid #999999;
			}

			input.textboxes {
				width:200px;
				background-color:#ffffff;
				font-family: "Lucida Grande",Verdana,sans-serif;
				font-size:18px;
				border: 1px solid #999999;

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

			//code to add New user
			function save(){
				document.forms[0].action="SaveUser.htm";
				document.forms[0].submit();
			}

		    //code to edit a user
			function clear(){
				document.getElementById("name").value ="";
				document.getElementById("psw").value ="";
			}
		</script>
	</head>
	<body>
        <form:form method="POST" commandName="userForm" name="userForm" >
            <%@include file="/WEB-INF/jsp/myHeader.jsp" %>
            <form:hidden name="loggedInUser" path="loggedInUser" />
	        <form:hidden name="loggedInRole" path="loggedInRole" />
            <div id="content">
                <table class="myTable">
                    <tr>
                        <td>
                            <label for="name">User Name:</label>
                            <label class="mandatory">*</label>
                        </td>
                        <td>
                            <form:input path="name" cssClass="textboxes" id="name" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="password">Password:</label>
                            <label class="mandatory">*</label>
                        </td>
                        <td>
                            <form:password path="password" cssClass="textboxes" id="psw" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label	for="role">Role:</label>
                            <label class="mandatory">*</label>
                        </td>
                        <td>
                            <form:select path="role" cssClass="textboxes" id="role" >
                                <form:option value="admin">admin</form:option>
                                <form:option value="guest">guest</form:option>
                            </form:select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <input class="btn" value="Save" type="button" onclick="javascript:save();" />
                            <input class="btn" value="Clear" type="button" onclick="javascript:clear();" />
                        </td>
                    </tr>
                </table>
		    </div>
        </form:form>
	</body>
</html>
