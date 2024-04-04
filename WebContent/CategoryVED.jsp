<%@ page language="java" import="java.util.ArrayList"%>
<%@ page import="com.mvc.dao.CategoryDAO"%>
<%@ page import="com.mvc.beans.CategoryBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>:: Category View ::</title>
</head>
<body>

	<table border="1">
		<tr>
			<th>SERIALL NO.</th>
			<th>CATEGORY NAME</th>
			<th>EDIT</th>
			<th>DELETE</th>
		</tr>

		<%
			int i = 1;
			CategoryBean categoryBean = new CategoryBean();
			ArrayList<CategoryBean> category = CategoryDAO.getAllCategories();
			for (CategoryBean cat : category) {
		%>
		<tr>
			<%-- <td><%=cat.getCaId()%></td> --%>
			<td><%=i++ %></td>
			<td><%=cat.getCaName()%></td>
			<td><a href="CategoryEdit.jsp?id=<%=cat.getCaId()%>">EDIT</a></td>
			<td><a href="CategoryDelete.jsp?id=<%=cat.getCaId()%>">DELETE</a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>