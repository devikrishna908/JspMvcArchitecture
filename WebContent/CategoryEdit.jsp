<%@ page language="java"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.mvc.dao.CategoryDAO"%>
<%@ page import="com.mvc.beans.CategoryBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Update</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		CategoryBean category = new CategoryBean();
		category.setCaId(id);
		ArrayList<CategoryBean> categorybean = CategoryDAO.getCategoryDetailsById(category);
	%>
	<form name="categoryEdit" method="post" action="CategoryEditAction.jsp">
		<table>
			<%
				for (CategoryBean cat : categorybean) {
			%>
			<tr>
				<td></td>
				<td><input name="cateId" type="hidden"
					value="<%=cat.getCaId()%>" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input name="catName" type="text"
					value="<%=cat.getCaName()%>" /></td>
			</tr>
			<%
				}
			%>

			<tr>
				<td></td>
				<td><input type="submit" value="UPDATE" /></td>
			</tr>
		</table>
	</form>
</body>
</html>