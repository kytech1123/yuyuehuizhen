<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
	String str= request.getParameter("back");
	
	
	String act = request.getParameter("act");
	// 查找返回网址
	if( act != null && act.equals("find") )
	{
		String ret= (String)session.getAttribute("hisBack");
		out.print("{\"hisFind\":\""+ret+"\"}");
	}
	else
	{
		session.setAttribute("hisBack", str);
		out.print("his="+str);
	}
%>
