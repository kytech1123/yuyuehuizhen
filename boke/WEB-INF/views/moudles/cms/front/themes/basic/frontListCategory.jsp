<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.description}" />
	<meta name="keywords" content="${category.keywords}" />
	<script type="text/javascript">
	function login(){
		/* layer.open({
		      type: 1,
		      area: ['600px', '360px'],
		      btn:['确定','取消'],
		      yes: function(index, layero){
		    	    //按钮【按钮一】的回调
		    	  $.ajax({ url: "${ctx}/doctor/doctorData/login", 
		    	    	 type: "get", 
		    	    	 data:$("#logindata").serialize(),
		    	    		success: function(data){
		    	    			if(data.Message=="OK"){
		    	    				$('#doctorName').val('');
		    	    				$('#password').val('');
		    	    			alert('登录成功');
		    	    			location.reload();}
		    	    			else{
		    	    				alert(data.Message);
		    	    			}
		    	    		}});
		    	  }
		    	  ,btn2: function(index, layero){
		    	    //按钮【按钮二】的回调
		    	    //return false 开启该代码可禁止点击该按钮关闭
		    	  },
		      shadeClose: true, //点击遮罩关闭
		      content: document.getElementById('login').innerHTML
		    });	 */
		    
		layer.open({title: '输入用户名和密码', 
			type: 1,
			area: ['600px', '360px'],
			btn:['登录','取消'],
			yes: function(index, layero){
	    	    //按钮【按钮一】的回调
	    	  $.ajax({ url: "${ctx}/doctor/doctorData/login", 
	    	    	 type: "get", 
	    	    	 data:$("#logindata").serialize(),
	    	    		success: function(data){
	    	    			if(data.Message=="OK"){
	    	    				layer.msg('登录成功！！', {icon: 6,time:3000},function(){
	    	    					location.reload();
	    	    				}); 
	    	    			}
	    	    			else{
	    	    				layer.msg(data.Message, {icon: 7}); 
	    	    			}
	    	    		}});
	    	  }
	    	  ,btn2: function(index, layero){
	    	    //按钮【按钮二】的回调
	    	    //return false 开启该代码可禁止点击该按钮关闭
	    	  },
	      shadeClose: true, //点击遮罩关闭
	      content: "<div class='span12' align='middle' id='login'><form id='logindata' class='form-horizontal'>"+
			"<div class='control-group'><label class='control-label' for='inputEmail' >用户名</label><div class='controls'>"+
		    "<input id='doctorName'  type='text' name='doctorName'/></div></div><div class='control-group'>"+
            "<label class='control-label' for='password'>密码</label><div class='controls'>"+
			"<input id='password'  type='password' name='password' /></div><p align='middle'><font id='fon' style='color: red;'></font></p>"+
			"</div></form></div>"
		});  
	}
	
	</script>
</head>
<body>
 <style>
    .divs .imgs{
        display: inline-block;
        vertical-align: middle;
    }
    .divs.caption{
        display: inline-block;
    }
    </style>
	 <div class="">
	  <%--  <div class="span2">
	   	 <h4>栏目列表3333</h4>
		 <ol>
		 	<a href="/jeesite/f/list-3.html" target="">专家 </a>
		 </ol>
		 <h4>推荐阅读3333</h4>
		 <ol>
		 	<cms:frontArticleHitsTop category="${category}"
		 </ol>
	   </div> 
	   <div class="span10">
		 <ul class="breadcrumb">
		    <cms:frontCurrentPosition category="${category}"/>
		 </ul>
	   </div>
	   <div class="span10">
	      <c:set var="index" value="1"/>
		  <c:forEach items="${categoryList}" var="tpl">
			<c:if test="${tpl.inList eq '1' && tpl.module ne ''}">
				<c:set var="index" value="${index+1}"/>
				${index % 2 eq 0 ? '<div class="row">':''}
		    	<div class="span5">
		    		<h4><small><a href="${ctx}/list-${tpl.id}${urlSuffix}" class="pull-right">更多&gt;&gt;</a></small>${tpl.name}</h4>
					<c:if test="${tpl.module eq 'article'}">
		    			<ul><c:forEach items="${fnc:getArticleList(site.id, tpl.id, 5, '')}" var="article">
							<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}" style="color:${article.color}">${fns:abbr(article.title,40)}</a></li>
						</c:forEach></ul>
					</c:if>
					<c:if test="${tpl.module eq 'link'}">
		    			<ul><c:forEach items="${fnc:getLinkList(site.id, tpl.id, 5, '')}" var="link">
							<li><span class="pull-right"><fmt:formatDate value="${link.updateDate}" pattern="yyyy.MM.dd"/></span><a target="_blank" href="${link.href}" style="color:${link.color}">${fns:abbr(link.title,40)}</a></li>
						</c:forEach></ul>
					</c:if>
		    	</div>
		    	${index % 2 ne 0 ? '</div>':''}
			</c:if>
		  </c:forEach>
	   </div>
	</div> --%>
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="#">专家库</a> <span class="divider"> <span class="divider"></span>
				</li>
				<li>
					 <a href="${ctx}/doctor/doctorData/form">加入我们</a> <span class="divider"></span>
				</li>
				<li>
					 <a href="#" onclick="login()">登录</a> <span class="divider"></span>
				</li>
				<!-- <li>
					<a href="#">类目</a> <span class="divider">/</span>
				</li>
				<li class="active">
					
				</li> -->
			</ul>
			<ul class="thumbnails">
			<c:forEach items="${pagedoctor.list}" var="doctors" varStatus="doc">
				 <li class="span4"> 
					<div class="thumbnail">
						<div class="imgs"><img style="width:102.4px;height:130.8px;" align="left" src="${doctors.imge}"  />
						<p align="left">
								${doctors.doctorName}
							</p>
							<p align="left">
							医院： ${doctors.hospitalData.hospitalName}
							</p>
							<p align="left">
							科室： ${doctors.departmentData.department}
							</p>
							<p align="left">
							<a href="${ctx}/doctor/doctorData/view?id=${doctors.id}"  title="查看专家详情">专家详情</a>
							</p>
						</div>
					</div>
			</li> 
			</c:forEach>
			</ul>
		</div>
	</div>
</div>
</body>
</html>