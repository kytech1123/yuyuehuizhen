<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">

<head>
    <title>模拟alert和confirm提示框</title>
    
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 2021.10.14 时间处理 -->
<script src="${ctx}/js/jstime.js"></script>
<script src="${ctx}/js/jsconfig.js"></script>
<script src="${ctx}/js/jsdata.js"></script>
<script src="${ctx}/js/js_dialog.js"></script>

</head>
<body>
https://blog.csdn.net/qiuzhi__ke/article/details/48167793

/boke/WebRoot/util/dialog.jsp

    <input id="add" type="button" value="添加" />
    <input id="delete" type="button" value="删除" />
    <input id="update" type="button" value="修改" />
    
    <script type="text/javascript">
        $("#add").bind("click", function () {
            $.MsgBox.Alert("消息", "哈哈，添加成功！");
        });
        //回调函数可以直接写方法function(){}
        $("#delete").bind("click", function () {
            $.MsgBox.Confirm("温馨提示", "执行删除后将无法恢复，确定继续吗？温馨提示", function () { alert("你居然真的删除了..."); });
        });
        function test() {
            alert("你点击了确定,进行了修改");
        }
        //也可以传方法名 test
        $("#update").bind("click", function () {
            $.MsgBox.Confirm("温馨提示", "确定要进行修改吗？", test);
        });
        //当然你也可以不给回调函数,点击确定后什么也不做，只是关闭弹出层
　　　　 //$("#update").bind("click", function () { $.MsgBox.Confirm("温馨提示", "确定要进行修改吗？"); });
    </script>
</body>
</html>