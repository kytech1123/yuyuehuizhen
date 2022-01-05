<%@ page language="java" contentType="text/html; charset=utf-8"
      %>
<%
	session.removeAttribute("logined_user");
	response.sendRedirect("main.jsp");
%>
 
