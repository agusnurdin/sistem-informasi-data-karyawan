<%-- 
    Document   : index
    Created on : Jul 11, 2012, 7:27:02 PM
    Author     : Luckma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String p = (String) session.getAttribute("status");
    if (p != null) {
        if (p.equals("activated")) {
            response.sendRedirect("administrator/home.jsp");
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="assets/css/dark-hive/easyui.css">
        <link rel="stylesheet" type="text/css" href="assets/css/icon.css">
        <link rel="stylesheet" type="text/css" href="assets/css/main.css">
        <script type="text/javascript" src="assets/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.easyui.min.js"></script>
        <script>
            function login(){  
                $('#fm').form('submit',{  
                    url: 'Login',  
                    onSubmit: function(){  
                        return $(this).form('validate');  
                    },  
                    success: function(result){  
                        var result = eval('('+result+')');  
                        if (result.success){  
                            window.location='administrator/home.jsp'  
                        } else {
                            $('#fm').form('clear');
                            $.messager.show({  
                                title: 'Error',  
                                msg: result.msg
                            });
                        }  
                    }  
                });  
            }  
        </script>
    </head>
    <body style="background-color:black;padding-top:10%;">
    <center>
        <form id="fm" method="post" style="background-image:url('assets/img/bg_login.jpg');background-repeat: no-repeat;background-position:center;width:288px;height:330px">
            <div style="padding-top:190px">
                <div class="fitem">
                    <input type="text" class="easyui-validatebox" name="username" placeholder="username" data-options="required:true"/>
                </div>
                <div class="fitem">
                    <input type="password" class="easyui-validatebox" name="password" placeholder="password" data-options="required:true"/>
                </div>
                <div class="fitem">
                    <input type="checkbox" class="easyui-validatebox" name="remember_me"/>
                    <a>Remember me</a>
                </div>
                <div class="fitem">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="login()">Login</a>
                </div>
            </div>
        </form>
    </center>
</body>
</html>