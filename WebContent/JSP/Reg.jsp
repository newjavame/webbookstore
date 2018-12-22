<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath(); //上下文路径
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册账号</title>
<link rel="stylesheet" type="text/css" href="../css/logreg.css" />
</head>
<script language="javascript">
	var flag = 0;//全局变量
	function onChang1(obj) {
		var obValue = obj.value;
		if (obValue.length > 8 || obValue.length < 3) {
			document.getElementById("usName").innerHTML = "<font name='usName' style='font-size:12px;color:red'>长度要求3-8位!</font>";
			flag = 0;
		} else {
			//document.getElementById("usName").innerHTML = "<font name='usName' style='font-size:12px;color:green'>可以使用</font>";
			flag++;
		}
	}
	function onChang2(obj) {
		var obValue = obj.value;
		if (obValue.length > 8 || obValue.length < 6) {
			document.getElementById("usPass").innerHTML = "<font name='usPass' style='font-size:12px;color:red'>长度要求6-8位!</font>";
			flag = 0;

		} else {
			//document.getElementById("usPass").innerHTML = "<font name='usPass' style='font-size:12px;color:green'>可以使用</font>";
			flag++;
		}
	}
	function onChang3(obj) {
		var obValue = obj.value;
		var pass = document.getElementById("userpass").value;
		if (obValue != pass) {
			document.getElementById("usPass1").innerHTML = "<font name='usPass1' style='font-size:12px;color:red'>请再次确认密码!</font>";
			flag = 0;

		} else {

			//document.getElementById("usPass1").innerHTML = "<font name='usPass1' style='font-size:12px;color:green'>通过</font>";
			flag++;
		}
	}
	function res() {
		document.getElementById("username").value = "";
		document.getElementById("userpass").value = "";
		document.getElementById("userpass1").value = "";

	}
	function sub() {
		var name = document.getElementById("username").value;
		var pass = document.getElementById("userpass").value;
		var pass1 = document.getElementById("userpass1").value;
		if (name != null && pass != null && pass1 != null
				&& pass.equals("pass1")) {
			if (flag == 3) {
				document.register.submit();
			} else {
				alert("请认真填写注册信息");
				document.getElementById("username").value = "";
				document.getElementById("userpass").value = "";
				document.getElementById("userpass1").value = "";
				document.getElementById("usName").innerHTML = "";
				document.getElementById("usPass").innerHTML = "";
				document.getElementById("usPass1").innerHTML = "";
			}
		}
	}
</script>
<body class="body2">
	<div
		style="text-align: center; font-family: YouYuan; font-size: 42px; margin-top: 75px;">
		<big>欢迎新用户注册！</big>
	</div>
	<form method="post" action="<%=path%>/servlet/doReg" name="register">
		<table align="center" valign="center">
			<tr>
				<td align="right"><font
					style="font-family: FangSong; font-size: 30px;">用户名：</font></td>
				<td><input type="text" name="username" id="username"
					onChange="onChang1(this)" style="width: 300px; height: 30px;">
				<td id="usName"></td>
			</tr>
			<tr>
				<td align="right"><font
					style="font-family: FangSong; font-size: 30px;">密码：</font></td>
				<td><input type="password" name="userpass" id="userpass"
					value="" onChange="onChang2(this)"
					style="width: 300px; height: 30px;">
				<td id="usPass"></td>
			</tr>
			<tr>
				<td align="right"><font
					style="font-family: FangSong; font-size: 30px;">确认密码：</font></td>
				<td><input type="password" name="userpass1" id="userpass1"
					value="" onChange="onChang3(this)"
					style="width: 300px; height: 30px;">
				<td id="usPass1"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="注册"
					onClick="sub()"
					style="font-family: FangSong; font-size: 25px; width: 200px; height: 40px;"></input>
			</tr>
		</table>
	</form>
</body>
</html>