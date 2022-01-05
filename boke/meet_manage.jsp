<%@ page language="java" contentType="text/html; charset=utf-8"      %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>会诊管理</title>
<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/meet.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">


<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>

<!-- 11 -->
<!-- work2021.8.25 -->
     
<!-- top导航 -->
<div class="top_nag">
	<div class="top_p1">
		<a href="meet.jsp">
		<img src="images/top/back.png">
		</a>
	</div>
	<div class="top_p2">
	<a href="index.jsp">
	<img src="images/top/set.png">
	</a>
	</div>
</div>

<br>
<br>
<br>

<div class="main_meet">
	<%
		String meetdata=(String)application.getAttribute("meet_data");
	
	String reportUser = (String)application.getAttribute("reportUser" );
	String receiverUser  = (String)application.getAttribute("receiverUser");
	
	////////////
		String [] records=meetdata.split(";");
		String [] reportUser_Ar=reportUser.split(";");
		String [] receiverUser_Ar=receiverUser.split(";");
		
		String view_row="";
		String view_row_css="";
		String [] data_row;

		int i=0;
			data_row= records[i].split(",");
			
			view_row="主诉科室: "
			+data_row[0]+"<br>"
			+"主诉问题: "+data_row[1]+"<br>"
			+"发起医院: "+data_row[2]+"<br>"
			+"时间: "+data_row[3]+"<br>"
					+"状态: " +data_row[4]
					+", "+ data_row[5]
							;
			view_row_css=
					"<div class='meet_item'>"
					+"<div class='meet_item_p1'>"
							+view_row
					+"</div>"
					+"<div class='meet_item_p2'>"
							+data_row[6]+"&nbsp;<br><br>"
							
							+"<a href='meet_detail.jsp'>详情</a>"+"&nbsp;<br>"
					+"</div>"
					+"</div>"
					;
			out.print(view_row_css);
			%>
			
					<div class='meet_item'>
					<div class='meet_item_p1'>
							预约:<br>
							<input type="checkbox" name="vehicle" value="Bike" checked="checked">允许添加病例
							<br>
							<%=reportUser_Ar[i].replace("#","<br>") %>
					</div>
						<div class='meet_item_p2'>
						<button class="button">添加汇报人</button>
						<button class="button">添加病例</button>
						</div>
					</div>

					<div class='meet_item'>
					<div class='meet_item_p1'>
							专家:<br>
							<br>
							<%=receiverUser_Ar[i].replace("#","<br>") %>
					</div>
						<div class='meet_item_p2'>
						<br>
						<br>
						<br>
						<button class="button">添加专家</button>&nbsp;
						<button class="button">专家转单</button>
						</div>
					</div>

					<div class='meet_item'>
					<div class='meet_item_p1'>
							会前准备:<br>
							开会方式：<br>
							<input type="radio" name="meet_soft" checked="checked">群爱会议软件<br>
							<input type="radio" name="meet_soft">钉钉<br>
							<input type="radio" name="meet_soft">腾讯会议<br>
							<input type="radio" name="meet_soft">其他<br>
							<input type="checkbox" name="vehicle"  checked="checked">允许网络直播
					</div>
						<div class='meet_item_p2'>
						</div>
					</div>


					<div class='meet_item_help'>
						<div class='meet_item_p1'>
								会前准备-医助客服:<br>
								请将病例文件发至医助，学习会议软件使用。<br>
								李世俊--医助：小田 微信 178********<br>
								王安庆--医助：小路 微信 182********<br>
								王贵--医助：待分配<br>
								李工--医助：待分配<br>
						</div>
						<div class='meet_item_p2'>
						<button class="button">添加医助</button>&nbsp;
						</div>
					</div>

					<div class='meet_item_before'>
						<div class='meet_item_p1'>
								会前测试:<br>
								李世俊--医助：小田 微信 178********<br>
													场地：
													<input type="radio" name="meet_addr1" checked="checked">群爱会诊中心
							<input name="meet_addr1" type="radio" >个人单位<br>
						测试：<input type="checkbox" checked="checked">会前测试已完成<br>
								<br>
								王安庆--医助：小路 微信 182********<br>
												场地：<input type="radio" name="meet_addr2" checked="checked">群爱会诊中心
							<input type="radio"  name="meet_addr2">个人单位<br>
													测试：<input type="checkbox" checked="checked">会前测试已完成<br>
								<br>
								王贵--医助：待分配<br>
								
													场地：<input name="meet_addr3" type="radio" checked="checked">群爱会诊中心
							<input name="meet_addr3" type="radio" >个人单位<br>
													测试：<input type="checkbox" checked="checked">会前测试已完成<br>
								<br>
								李工--医助：待分配<br>
													场地：
													<input name="meet_addr4" type="radio" checked="checked">群爱会诊中心
							<input type="radio" name="meet_addr4" >个人单位<br>
													测试：<input type="checkbox" checked="checked">会前测试已完成<br>
								<br>
						</div>
						<div class='meet_item_p2'>
						</div>
					</div>
					
					<div class='meet_item'>
						<div class='meet_item_p1'>
								会议直播:<br>
						</div>
						<div class='meet_item_p2'>
						<br>
							<button class="button">编辑专家介绍</button>
							<button class="button">编辑会议议程</button>
							<button class="button">上传海报</button>
							<button class="button">设置直播间链接</button>
							<button class="button">网友互动</button>
						</div>
					</div>
					<div class='meet_item'>
						<div class='meet_item_p1'>
								会后反馈:<br>
						</div>
						<div class='meet_item_p2'>
							<br>
							<button class="button">专家留言簿</button>
							<button class="button">汇报人评分</button>
							<button class="button">金牌医助</button>
						</div>
					</div>
	</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<div class="bottom_nag">
<ul class="navig_menu">
	<li>
	<a href="index.jsp">首页
	</a>
	</li>
	<li><a href="meet.jsp">会诊
	</a>
	</li>
	<li><a href="#">消息
	</a>
	</li>
	<li><a href="#">我的
	</a>
	</li>
</ul></div>

</body>
</html>
 
