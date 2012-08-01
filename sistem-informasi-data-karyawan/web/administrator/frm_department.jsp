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
        <script type="text/javascript">
            var colTable = [[  
                    {field:'id',title:'ID',width:25,align:'center'},  
                    {field:'name',title:'Name',width:50},  
                    {field:'description',title:'Description',width:75}  
                ]];
            var urlEnd = 'Department';
        </script>
    </head>
    <body>

        <table id="dg" class="easyui-datagrid">
        </table>

        <div id="dlg" class="easyui-dialog" data-options="buttons:'#dlg-buttons',closed:true">
            <div class="ftitle">Department Data</div>
            <form id="fm" method="post" novalidate>
                <div class="fitem">
                    <label>Department ID:</label>
                    <input class="easyui-validatebox" name="id" data-options="required:true">
                </div>
                <div class="fitem">
                    <label>Name:</label>
                    <input class="easyui-validatebox" name="name" data-options="required:true">
                </div>
                <div class="fitem">
                    <label>Description:</label>
                    <textarea class="easyui-validatebox" name="description" data-options="required:true"></textarea>
                </div>
                <div class="fitem">
                    <label>Manager:</label>
                    <input class="easyui-combobox" name="manager" data-options="url:'../GetsEmployee',valueField:'id',textField:'full_name',panelHeight:'auto'" style="width:150px">
                </div>
                <div class="fitem">
                    <label>Street Address:</label>
                    <input class="easyui-validatebox" name="street_address" data-options="required:true">
                </div>
                <div class="fitem">
                    <label>Postal Code:</label>
                    <input class="easyui-validatebox" name="postal_code" data-options="required:true">
                </div>
                <div class="fitem">
                    <label>City:</label>
                    <input class="easyui-validatebox" name="city" data-options="required:true">
                </div>
                <div class="fitem">
                    <label>State Province:</label>
                    <input class="easyui-validatebox" name="state_province" data-options="required:true">
                </div>
                <div class="fitem">
                    <label>Country:</label>
                    <input class="easyui-validatebox" name="country" data-options="required:true">
                </div>
            </form>
        </div>
    </body>
</html>
