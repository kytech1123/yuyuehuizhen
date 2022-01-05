<%@ page language="java" contentType="text/html; charset=utf-8"      %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>会诊大厅</title>
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
		<a href="index.jsp">
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
<br>
<br>
<br>
<br>



<div class="dui-container">
<div class="search">
	<form class="meet-search-form" method="get"  >
        <!--输入框-->
            <!--autoFocus-->
            <div>
               <input type="text" autocomplete="off"
                       placeholder="输入姓名/医院/科室" />
            <input type="submit" class="enter-btn"  value="查询"/>
        </div>
    </form>
 	<form class="meet-search-form" method="get"  >
      <select>
		<option value="">地区</option>
		<option value="">陕西</option>
		<option value="">山西</option>
		<option value="">上海</option>
		</select>
		<select>
		<option value="">医院</option>
		<option value="">山西医科大学第一医院</option>
		<option value="">西京医院</option>
		<option value="">运城同德医院</option>
		</select>

		<select>
			<option value="">排序方式</option>
			<option value="">时间</option>
			<option value="">会议状态</option>
		</select>
		<select>
		<option value="">状态</option>
		<option value="">未开始</option>
		<option value="">进行中</option>
		<option value="">已结束</option>
		</select>
    </form>
    <br>&nbsp;
</div>
</div>

<div class="main_meet">
	<%
		String meetdata=(String)application.getAttribute("meet_data");
	
	String reportUser = (String)application.getAttribute("reportUser" );
	String receiverUser  = (String)application.getAttribute("receiverUser");
	
		String [] records=meetdata.split(";");
		
		String view_row="";
		String view_row_css="";
		String [] data_row;
		for(int j=0;j<5;j++)
		for(int i=0;i< records.length; i++)
		{
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
							+"<a href='meet_detail.jsp'>详情</a>"+"&nbsp;<br><br>"
							+"<a href='meet_manage.jsp'>管理</a>"+"&nbsp;<br>"
					+"</div>"
					+"</div>"
					;
			out.print(view_row_css);
// 			out.print("<br>");
			
	%>
	<%  }
	%>
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
	<li><a href="me.jsp">我的
	</a>
	</li>
</ul></div>

</body>
</html>
 
