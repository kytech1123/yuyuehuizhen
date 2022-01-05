<%@ page language="java" contentType="text/html; charset=utf-8"      %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>会诊详情</title>
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
							
							+"<a href='meet_manage.jsp'>管理</a>"+"&nbsp;<br>"
					+"</div>"
					+"</div>"
					;
			out.print(view_row_css);
			
			view_row_css=
					"<div class='meet_item'>"
					+"<div class='meet_item_p1'>"
							+"发起人:<br>"+ reportUser_Ar[i].replace("#","<br>")
					+"</div>"
					+"</div>"
					;
			out.print(view_row_css);

			view_row_css=
					"<div class='meet_item'>"
					+"<div class='meet_item_p1'>"
							+"会诊专家:<br>"+ receiverUser_Ar[i]
					+"</div>"
					+"</div>"
					;
			out.print(view_row_css);
// 			out.print("<br>");
			
	%>
	<div class='meet_item'>
					<div class='meet_item_p1'>
							会诊直播：
					</div>
						<div class='meet_item_p2'>
						<button class="button">专家介绍</button>
						<button class="button">会议议程</button>
						<button class="button">分享海报</button>
						<button class="button">观看直播</button>
						<button class="button">评论留言</button>
						</div>
					</div>
	</div>
	<div class='meet_item'>
					<div class='meet_item_p1'>
							群爱大数据：<br>
							根据病情特征，请您参考同类往期会诊。
					</div>
						<div class='meet_item_p2'>
						<button class="button">第35期</button>
						<button class="button">第42期</button>
						<button class="button">第51期</button>
						</div>
					</div>
	</div>
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
 
