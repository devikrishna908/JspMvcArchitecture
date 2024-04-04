<%@ page language="java" %>
<%@page import="com.mvc.beans.CategoryBean"%>
<%@page import="com.mvc.dao.CategoryDAO"%>
<%
	int cateId = Integer.parseInt(request.getParameter("id"));
	
	CategoryBean categoryBean = new CategoryBean();
	categoryBean.setCaId(cateId);
	 
	boolean flag = CategoryDAO.deleteCategory(categoryBean);
	if(flag)
		response.sendRedirect("CategoryVED.jsp");
	else
		response.sendRedirect("Error.jsp");
	
%>