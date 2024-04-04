<%@page language="java" import="java.sql.*,java.util.*"%>
<%@page import="com.mvc.beans.CategoryBean"%>
<%@page import="com.mvc.dao.CategoryDAO"%>
<%
	String catName = request.getParameter("catName");

	CategoryBean categoryBean = new CategoryBean();

	categoryBean.setCaName(catName.toUpperCase().trim());
	
	boolean flag = CategoryDAO.insertCategory(categoryBean);
	
	if (flag) {
		response.sendRedirect("index.html");
	} else {
		response.sendRedirect("Error.jsp");
	}
	
%>