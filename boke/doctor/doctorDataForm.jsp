<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>医生管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		//级联获取科室
		function sel(){
			var couhtml="<option value=''></option>";
			var s=$("#hospitalId").val();
	        $.ajax({ url: '${ctx}/department/departmentData/departmentSelect?hospitalId=' + s, 
	        	 type: "get", 
	        	 async: false,
	        		success: function(data){
	        			var rep=data.rep;
	        			for(var o in rep){
	        				couhtml+="<option value='"+rep[o].id+"'>"+rep[o].department+"</option>";
	        			}
	        			document.getElementById("departmentId").innerHTML=couhtml;
	        		}});
		}
		
		/* function reduce(v){
			$(v).parent().parent().remove();
		}
		function del(a){
			$(a).parent().prev().prev().prev().remove();
			$(a).parent().prev().prev().remove();
			$(a).parent().prev().remove();
			$(a).parent().remove();
		} */
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/doctor/doctorData/">医生列表</a></li>
		<li class="active"><a href="${ctx}/doctor/doctorData/form?id=${doctorData.id}">医生<shiro:hasPermission name="doctor:doctorData:edit">${not empty doctorData.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="doctor:doctorData:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="doctorData" action="${ctx}/doctor/doctorData/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">医生姓名：</label>
			<div class="controls">
				<form:input path="doctorName" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">职称：</label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">医院：</label>
			<div class="controls">
				<form:select path="hospitalId" class="input-xlarge required">
					<form:option value="" label=""/>
					<c:forEach items="${hospitalList}" var="hospital"> 
                      <form:option value="${hospital.id}" label="${hospital.hospitalName}"/> 
                     </c:forEach> 
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">科室：</label>
			<div class="controls">
				<form:select path="departmentId" class="input-xlarge required">
					<form:option value="" label=""/>
					<c:forEach items="${departmentDataList}" var="department"> 
                      <form:option value="${department.id}" label="${department.department}"/> 
                     </c:forEach> 
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">个人简介：</label>
			<div class="controls">
				<form:textarea id="content" htmlEscape="true"  path="profile" rows="4" maxlength="1000" class="input-xxlarge required"/>
				<sys:ckeditor replace="profile"  uploadPath="/cms/doctorData" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">擅长:</label>
			<div class="controls">
				<form:textarea path="skill" htmlEscape="false" rows="3" maxlength="255" class="input-xlarge"/>
			</div>
		</div>
		<c:if test="${not empty doctorData.id}">
		<div class="control-group" id="conle">
			<label class="control-label">治疗经验：</label>
			<div class="controls">
			<c:if test="${empty expertDoctorList}">暂无治疗经验</c:if>
			<c:forEach items="${expertDoctorList}" var="expertDoctor"> 
				<input type="button" value="${expertDoctor.expertTag.expertDetail}${expertDoctor.count}"><!-- <font title="删除" style="color: blue;size: 5px;"><a onclick="del(this)">-</a></font> -->
				</c:forEach>
				</div>
			<%-- <div class="controls">
				<select id="expert" name="expert" style="width: 270px;">
				<option value=""></option>
				<c:forEach items="${expertTagList}" var="expertTag"> 
				<option value="${expertTag.id}">${expertTag.expertDetail}</option>
				</c:forEach>
				</select>
				<input value="" name="count" style="width: 70px;" type="number" maxlength="5" required="required">例
				<span class="help-inline"><font color="red">*</font> </span>
				<span class="help-inline"><a onclick="add()">+</a></span>
			</div> --%>
				<br>
				
		</div>
		</c:if>
		<div class="control-group">
			<label class="control-label">身份证号：</label>
			<div class="controls">
				<form:input path="idnumber" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术资格：</label>
			<div class="controls">
				<form:input path="qualification" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">医师资格证书编码：</label>
			<div class="controls">
				<form:input path="doctorCertificate" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">医生执业证书编码：</label>
			<div class="controls">
				<form:input path="medicalCertificate" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">医师技术资格证书时间：</label>
			<div class="controls">
				<input name="dcDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${doctorData.dcDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">医师执业资格证书时间：</label>
			<div class="controls">
				<input name="mcDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${doctorData.mcDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
			
				<form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">出生日期：</label>
			<div class="controls">
				<input name="birthday" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${doctorData.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">民族：</label>
			<div class="controls">
				<form:input path="nation" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">籍贯：</label>
			<div class="controls">
				<form:input path="nativePlace" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">登录名：</label>
			<div class="controls">
				<form:input path="loginName" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">密码：</label>
			<div class="controls">
				<form:input path="password" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">医生级别：</label>
			<div class="controls">
				<form:radiobuttons path="doctorGrader" items="${fns:getDictList('doctorGrader')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		 <div class="control-group">
			<label class="control-label">是否审核通过：</label>
			<%-- <div class="controls">
				<form:input path="loginFlag" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div> --%>
			<div class="controls">
				<form:radiobuttons path="loginFlag" items="${fns:getDictList('loginFlag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> 
		<div class="control-group">
			<label class="control-label">头像：</label>
			<div class="controls">
				<form:hidden id="imge" path="imge" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="imge" type="files" uploadPath="/doctor/doctorData" selectMultiple="true"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="doctor:doctorData:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>