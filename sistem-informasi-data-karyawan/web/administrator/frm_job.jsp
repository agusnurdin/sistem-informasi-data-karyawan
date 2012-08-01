<%-- 
    Document   : frm_job
    Created on : Jul 18, 2012, 11:46:14 AM
    Author     : Norman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../WEB-INF/jspf/custom.jspf" %>
        <script type="text/javascript">
            var colTable = [[  
                    {field:'id',title:'ID',width:25,align:'center'},  
                    {field:'title',title:'Title',width:50},  
                    {field:'description',title:'Description',width:75}  
                ]];
            var urlEnd = 'Job';
        </script>
    </head>
    <body>
        <table id="dg" class="easyui-datagrid">
        </table>

        <div id="dlg" class="easyui-dialog" data-options="buttons:'#dlg-buttons',closed:true">
            <div class="ftitle">Job Data</div>
            <form id="fm" method="post" novalidate>
                <div class="fitem">
                    <label>Job ID:</label>
                    <input class="easyui-validatebox" name="id" data-options="required:true">
                </div>
                <div class="fitem">
                    <label>Job Title:</label>
                    <input class="easyui-validatebox" name="title" data-options="required:true">
                </div>
                <div class="fitem">
                    <label>Job Description:</label>
                    <textarea class="easyui-validatebox" name="description" data-options="required:true"></textarea>
                </div>
            </form>
        </div>
    </body>
</html>

