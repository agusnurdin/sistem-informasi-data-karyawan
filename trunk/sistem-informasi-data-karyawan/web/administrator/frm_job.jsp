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
        <style type="text/css">
            #fm{
                margin:0;
                padding:10px 30px;
            }
            .ftitle{
                font-size:14px;
                font-weight:bold;
                color:#666;
                padding:5px 0;
                margin-bottom:10px;
                border-bottom:1px solid #ccc;
            }
            .fitem{
                margin-bottom:5px;
            }
            .fitem label{
                display:inline-block;
                width:80px;
            }         
            .fitem textarea{
                width:150px;
                height:100px;
            }
        </style>
        <script type="text/javascript">
            var urlInsert = '../InsertJob';
            var urlUpdate= '../UpdateJob?id=';
            var urlDelete = '../DeleteJob';
        </script>
    </head>
    <body>
        <table id="dg" title="Table Data" class="easyui-datagrid" style="width:auto;height:auto"
               url="../GetsJob"
               toolbar="#toolbar" pagination="true"
               rownumbers="true" fitColumns="true" singleSelect="true">
            <thead>
                <tr>
                    <th field="id" width="50">ID</th>
                    <th field="title" width="50">Title</th>
                    <th field="description" width="50">Description</th>
                </tr>
            </thead>
        </table>

        <%@include file="../WEB-INF/jspf/toolbar.jspf" %>

        <div id="dlg" class="easyui-dialog" style="width:450px;padding:10px 20px"
             closed="true" buttons="#dlg-buttons">
            <div class="ftitle">Job Data</div>
            <form id="fm" method="post" novalidate>
                <div class="fitem">
                    <label>Job ID:</label>
                    <input class="easyui-validatebox" name="id" required="true">
                </div>
                <div class="fitem">
                    <label>Title:</label>
                    <input class="easyui-validatebox" name="title" required="true">
                </div>
                <div class="fitem">
                    <label>Description:</label>
                    <textarea class="easyui-validatebox" required="true" name="description"></textarea>
                </div>
            </form>
        </div>
        <div id="dlg-buttons">
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveData()">Save</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
        </div>
    </body>
</html>

