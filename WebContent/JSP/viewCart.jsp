<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="bean.*,java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>显示购物车信息</title>
<link rel="stylesheet" type="text/css" href="../css/logreg.css" />
</head>
<body class="body1">
<h1 align="center">订单详情</h1>
	<%
		Map cart = (Map) session.getAttribute("cart");
		double total = 0;
		if (cart == null || cart.size() == 0) {
			out.println("购物车当前为空");
		} else {
			//创建用于显示内容的变量
			Set cartItems = cart.keySet();
			Object[] isbn = cartItems.toArray();
			Title book;
			CartItem cartItem;
			int quantity;//购买数量
			double price, subtotal;//价格和小计
	%>
	<table cellSpacing=0 cellPadding=0 width=490 border=1 align="center" valign="center">
		<thead>
			<tr>
				<th>书籍名称</th>
				<th>数量</th>
				<th>价格</th>
				<th>小计</th>
			</tr>
		</thead>
		<%
			int i = 0;
				while (i < isbn.length) {//根据ISBN来查找图书项逐一进行处理
					cartItem = (CartItem) cart.get((String) isbn[i]);
					book = cartItem.getTitle();
					quantity = cartItem.getQuantity();
					price = book.getPrice();
					subtotal = quantity * price;
					total += subtotal;
					i++;
		%>
		<tr>
			<td><%=book.getTitle()%></td>
			<td align="center"><%=quantity%></td>
			<td class="right"><%=new DecimalFormat("0.00").format(price)%></td>
			<td class="bold right"><%=new DecimalFormat("0.00").format(subtotal)%></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="4" class="bold right" align="right"><b>总计:</b><%=new DecimalFormat("0.00").format(total)%>
			</td>
		</tr>
	</table>
	<%
		session.setAttribute("total", new Double(total));
		}
	%>
	<br>
	<br>
	<center> <a href="../JSP/viewBook.jsp"  >继续购物</a></center>
	<br>
	<br>
	<form action="../HTML/order.html" method="get">
		<center><input type="submit" value="结账" style="width: 200px; height: 35px;"></center>
	</form>
</body>
</html>