<%@ page language="java"%>
<%@page import="com.mvc.beans.CategoryBean"%>
<%@page import="com.mvc.dao.CategoryDAO"%>
<%
	int cateId = Integer.parseInt(request.getParameter("cateId"));
	String catName = request.getParameter("catName").toUpperCase().trim();
	
	CategoryBean categoryBean = new CategoryBean();
	categoryBean.setCaId(cateId);
	categoryBean.setCaName(catName);
	 
	boolean flag = CategoryDAO.updateCategory(categoryBean);
	if(flag)
		response.sendRedirect("CategoryVED.jsp");
	else
		response.sendRedirect("Error.jsp");
	
%>