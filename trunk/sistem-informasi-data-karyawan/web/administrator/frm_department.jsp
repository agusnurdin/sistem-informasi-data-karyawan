<%-- 
    Document   : frm_department
    Created on : Jul 14, 2012, 1:05:16 AM
    Author     : Fajar_Ardhanta
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
            var urlInsert = '../InsertDepartment';
            var urlUpdate= '../UpdateDepartment?id=';
            var urlDelete = '../DeleteDepartment';
        </script>
    </head>
    <body>
        <table id="dg" title="Table Data" class="easyui-datagrid" style="width:auto;height:auto"
               url="../GetsDepartment"
               toolbar="#toolbar" pagination="true"
               rownumbers="true" fitColumns="true" singleSelect="true">
            <thead>
                <tr>
                    <th field="id" width="50">ID</th>
                    <th field="name" width="50">Name</th>
                    <th field="description" width="50">Description</th>
                    <th field="manager_name" width="50">Manager</th>
                </tr>
            </thead>
        </table>

        <%@include file="../WEB-INF/jspf/toolbar.jspf" %>

       <div id="dlg" class="easyui-dialog" style="width:450px;padding:10px 20px"
             closed="true" buttons="#dlg-buttons">
            <div class="ftitle">Department Data</div>
            <form id="fm" method="post" novalidate>
                <div class="fitem">
                    <label>Department ID:</label>
                    <input class="easyui-validatebox" name="id" required="true">
                </div>
                <div class="fitem">
                    <label>Name:</label>
                    <input class="easyui-validatebox" name="name" required="true">
                </div>
                <div class="fitem">
                    <label>Description:</label>
                    <textarea class="easyui-validatebox" required="true" name="description"></textarea>
                </div>
                <div class="fitem">
                    <label>Manager:</label>
                    <input class="easyui-combobox" name="manager" url="../GetsEmployee?id=M" valueField="id" textField="title" panelHeight="auto" style="width:150px">
                </div>
                <div class="fitem">
                    <label>Street Address:</label>
                    <input class="easyui-validatebox" name="street_address" required="true">
                </div>
                <div class="fitem">
                    <label>Postal Code:</label>
                    <input class="easyui-validatebox" name="postal_code" required="true">
                </div>
                <div class="fitem">
                    <label>City:</label>
                    <input class="easyui-validatebox" name="city" required="true">
                </div>
                <div class="fitem">
                    <label>State Province:</label>
                    <input class="easyui-validatebox" name="state_province" required="true">
                </div>
                <div class="fitem">
                    <label>Country:</label>
                    <input class="easyui-validatebox" name="country" required="true">
                </div>
            </form>
        </div>
        <div id="dlg-buttons">
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveData()">Save</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
        </div>
    </body>
</html>
