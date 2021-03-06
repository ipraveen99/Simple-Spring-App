<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>User List</title>
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

			#content {position:relative; z-index:1; padding:10px;}


			div.wrap {
				height:100%
				width:100%
			}

			#myTable {
				font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
				width:50%;
				border-collapse:collapse;
				margin:auto;
			}
			#myTable td, #myTable th {
				font-size:1em;
				border:1px solid #A24047;
				padding:3px 7px 2px 7px;
			}
			#myTable th  {
				font-size:1.1em;
				text-align:left;
				padding-top:5px;
				padding-bottom:4px;
				background-color:#A24047;
				color:#ffffff;
			}
			#myTable tr.alt td {
				color:#000000;
				background-color:#A24047;
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

			//code to add New user
			function addNew(){
				document.forms[0].action="AddUser.htm";
				document.forms[0].submit();
			}

			// delete user
			function deleteUser(){
			    var check ='false';
			    var count = 0;
                // get all check boxes
			    var checks = document.getElementsByName('checkField');
			    if(checks){
			        //if total number of rows is one
			        if(checks.checked){
			           deleteRow();
			        }else{
			           for(var i = 0 ; i < checks.length ; i++ ) {
			               if(checks[i].checked){
			                   check = 'true';
			                   count = count + 1;
			               }
			           }
                        //check for validity
                        if(check = 'true'){
                            if(count == 1){
                                deleteRow();
                            }else{
                                alert(" Only one row can be deleted at a time, please select one row ");
                            }
                        }else{
                            alert(" No rows selected, please select one row ");
                        }
			        }
			    }
			}

            //code to delete a user
			function deleteRow(){
			    var answer = confirm(" Are you sure you wanted to delete the user ");
			    if(answer){
			        //if yes then delete
			        var userRow;
                    var checks = document.getElementsByName('checkField');
                    if(checks.checked){
                        userRow = document.getElementById("myTable").rows[0];
                        document.getElementById("id").value = userRow.cells[0].childNodes[0].value;
                        document.forms[0].action="DeleteUser.htm";
				        document.forms[0].submit();
                    }else{
                        for(var i = 0; i < checks.length ; i++){
                            if(checks[i].checked) {
                                userRow = document.getElementById("myTable").rows[i+1];
                            }
                        }
                        document.getElementById("id").value = userRow.cells[0].childNodes[0].value;
                        document.forms[0].action="DeleteUser.htm";
                        document.forms[0].submit();
                    }
			    }

			}


			//preventing multiple checks
			function checkCall(e){
			    var min = e.value;
			    var checks = document.getElementsByName('checkField');
			    for(var i = 0; i < checks.length ; i++){
			        if(checks[i].value != min) {
			            checks[i].checked = false;
			        }
			    }
			}

            //validation before edit a user
			function editMe(){
				var check ='false';
			    var count = 0;
                // get all check boxes
			    var checks = document.getElementsByName('checkField');
			    if(checks){
			        //if total number of rows is one
			        if(checks.checked){
			           editRow();
			        }else{
			           for(var i = 0 ; i < checks.length ; i++ ) {
			               if(checks[i].checked){
			                   check = 'true';
			                   count = count + 1;
			               }
			           }
                        //check for validity
                        if(check = 'true'){
                            if(count == 1){
                                editRow();
                            }else{
                                alert(" Only one row can be edited at a time, please select one row ");
                            }
                        }else{
                            alert(" No rows selected, please select one row ");
                        }
			        }
			    }
			}

			//real edit
			function editRow(){
	            var userRow;
                var checks = document.getElementsByName('checkField');
                if(checks.checked){
                    userRow = document.getElementById("myTable").rows[0];
                    document.getElementById("id").value = userRow.cells[0].childNodes[0].value;
                    document.forms[0].action="EditUser.htm";
                    document.forms[0].submit();
                }else{
                    for(var i = 0; i < checks.length ; i++){
                        if(checks[i].checked) {
                            userRow = document.getElementById("myTable").rows[i+1];
                        }
                    }
                    document.getElementById("id").value = userRow.cells[0].childNodes[0].value;
                    document.forms[0].action="EditUser.htm";
                    document.forms[0].submit();
                }
            }

		</script>
	</head>
	<body>
        <form:form method="POST" commandName="userForm" name="userForm" action="listAll.htm" >
        <%@include file="/WEB-INF/jsp/myHeader.jsp" %>
        <input type="hidden" name="id" id="id" />
        <form:hidden name="loggedInUser" path="loggedInUser" />
	    <form:hidden name="loggedInRole" path="loggedInRole" />
        <div id="content">
            <div class="wrap">
                <table border="2" id="myTable">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Name</th>
                            <th>Password</th>
                            <th>Role</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${userForm.userVOs}" var="iterationUser">
                            <tr>
                                <td><input type="checkbox" name="checkField" onclick="javascript:checkCall(this)" value="<c:out value="${iterationUser.id}" />" /></td>
                                <td><c:out value="${iterationUser.name}" /></td>
                                <td><c:out value="${iterationUser.password}" /></td>
                                <td><c:out value="${iterationUser.role}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
				<table  style="margin:auto;top:50%;left:50%;">
				<tr>
				<td>
            <br/>
            <br/>

			<input class="btn" value="Add New User" type="button" onclick="javascript:addNew()" />
            <input class="btn" value="Edit User" type="button" onclick="javascript:editMe()" />
            <input class="btn" value="Delete User" type="button" onclick="javascript:deleteUser()" />
			</td>
			</tr>
			</table>
			</div>
		</div>
		</form:form>
	</body>
</html>
