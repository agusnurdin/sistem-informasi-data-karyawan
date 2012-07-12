<%-- 
    Document   : home
    Created on : Jul 11, 2012, 8:32:34 PM
    Author     : Luckma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String p = (String) session.getAttribute("status");
            if (p == null || !p.equals("activated")) {
                response.sendRedirect("../index.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../WEB-INF/jspf/custom.jspf" %>
        <script>
            function addTab(title, url){  
                if ($('#tt').tabs('exists', title)){  
                    $('#tt').tabs('select', title);  
                } else {  
                    var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';  
                    $('#tt').tabs('add',{  
                        title:title,  
                        content:content,
                        closable:true  
                    });  
                }  
            }  
        </script>
    </head>
    <body class="easyui-layout">
        <%@include file="../WEB-INF/jspf/header.jspf" %>
        <div region="west" split="true" title="Main Menu" style="width:280px;padding1:1px;overflow:hidden;">
            <div class="easyui-accordion" fit="true" border="false">
                <div title="Profile" selected="true" style="padding:10px;">
                    <img src="../file/images/image1.jpg"/>  
                </div>
                <div title="Master Data" style="overflow:auto;padding:10px;">
                    <ul class="easyui-tree">  
                        <li><a href="#"  onclick="addTab('Employee','frm_employee.jsp')">Employee</a></li>
                        <li><a href="#"  onclick="addTab('Job','frm_job.jsp')">Job</a></li>
                        <li><a href="#"  onclick="addTab('Department','frm_department.jsp')">Department</a></li>
                    </ul>
                </div>
                <div title="Setting" style="padding:10px">
                    <ul class="easyui-tree">  
                        <li><a href="#"  onclick="addTab('Maintenance','#')">Maintenance</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div region="center" title="Main Title" style="overflow:hidden;">
            <div id="tt" class="easyui-tabs" fit="true" border="false">
                <div title="Start Page" style="padding:20px;overflow:hidden;"> 
                    <div style="margin-top:20px;">
                        <h1>Welcome Administrator</h1>
                        <p>blablablablablablablablablablablablablablablablabla</p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
