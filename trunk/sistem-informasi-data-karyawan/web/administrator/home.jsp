<%-- 
    Document   : home
    Created on : Jul 11, 2012, 8:32:34 PM
    Author     : Luckma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String p = (String) session.getAttribute("status");
    if (p == null || !p.equals("activated")) {
        response.sendRedirect("../index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../WEB-INF/jspf/custom.jspf" %>
    </head>
    <body class="easyui-layout">
        <%@include file="../WEB-INF/jspf/header.jspf" %>

        <div data-options="region:'west',split:true" style="width:280px;padding1:1px;overflow:hidden;">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <div title="Administrator" data-options="selected:true" style="padding:10px;overflow:auto;">
                    <%
                        model.Users user = new dao.UsersDAOImpl(utils.PersistenceUtil.getEntityManager()).get((Long) session.getAttribute("user"));
                    %>
                    <div class="fitem">
                        <%
                            out.print("<img src=\"../" + user.getEmployee().getUrl_photo() + "\" style=\"width:100px;height:100px\"/>");
                        %>
                    </div>
                    <div class="fitem">
                        <label>User:</label>
                        <a><%= user.getEmployee().getFirst_name()%> </a>
                        <a><%= user.getEmployee().getLast_name()%></a>
                    </div>
                    <div class="fitem">
                        <label>Currently Use:</label>
                        <a><%= user.getCurrently_use()%></a>
                    </div>
                    <div class="fitem">
                        <label>IP Address:</label>
                        <a><%= user.getIp_address()%></a>
                    </div>
                </div>
                <div title="Master Data" style="padding:10px;">
                    <ul id="tt1" class="easyui-tree" data-options="animate:true,dnd:true">                                             
                        <li><a href="#"  onclick="addTab('Employee','frm_employee.jsp')">Employee</a></li>
                        <li><a href="#"  onclick="addTab('Job','frm_job.jsp')">Job</a></li>
                        <li><a href="#"  onclick="addTab('Department','frm_department.jsp')">Department</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div data-options="region:'center'" style="overflow:hidden;">
            <div id="tt" class="easyui-tabs" data-options="fit:true,border:false">
                <div title="Start page" style="padding:20px;overflow:hidden;"> 
                    <div style="margin-top:20px;">
                        <h3>Welcome Admin</h3>
                        
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
