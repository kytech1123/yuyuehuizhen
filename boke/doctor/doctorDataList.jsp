<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>医生管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/doctor/doctorData/">医生列表</a></li>
		<shiro:hasPermission name="doctor:doctorData:edit"><li><a href="${ctx}/doctor/doctorData/form">医生添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="doctorData" action="${ctx}/doctor/doctorData/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>医生姓名：</label>
				<form:input path="doctorName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>医院：</label>
				<form:select path="hospitalId" class="input-xlarge" >
					<form:option value=" " label=" "/>
					<c:forEach items="${hospitalList}" var="hospital"> 
                      <form:option value="${hospital.id}" label="${hospital.hospitalName}"/> 
                     </c:forEach> 
				</form:select>
			</li>
			<li><label>科室：</label>
				<form:select path="departmentId" class="input-xlarge required" onclick="sel()">
					<form:option value=" " label=" "/>
					<c:forEach items="${departmentDataList}" var="department"> 
                      <form:option value="${department.id}" label="${department.department}"/> 
                     </c:forEach> 
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
			<th>医生姓名</th>
				<th>职称</th>
				<th>性别</th>
				<th>民族</th>
				<th>登录名</th><th>审核状态</th>
				<shiro:hasPermission name="doctor:doctorData:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="doctorData">
			<tr>
			<td><a href="${ctx}/doctor/doctorData/form?id=${doctorData.id}">
					${doctorData.doctorName}
				</a></td>
				<td><a href="${ctx}/doctor/doctorData/form?id=${doctorData.id}">
					${doctorData.title}
				</a></td>
				<td>
					${fns:getDictLabel(doctorData.sex, 'sex', '')}
				</td>
				<td>
					${doctorData.nation}
				</td>
				<td>
					${doctorData.loginName}
				</td>
				<td>
					${fns:getDictLabel(doctorData.loginFlag,'loginFlag','')}
				</td>
				<shiro:hasPermission name="doctor:doctorData:edit"><td>
    				<a href="${ctx}/doctor/doctorData/form?id=${doctorData.id}">修改</a>
					<a href="${ctx}/doctor/doctorData/delete?id=${doctorData.id}" onclick="return confirmx('确认要删除该医生吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>