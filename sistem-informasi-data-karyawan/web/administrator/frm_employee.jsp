<%-- 
    Document   : frm_employee
    Created on : Jul 11, 2012, 9:14:30 PM
    Author     : Luckma
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
                    {field:'full_name',title:'Full Name',width:75},  
                    {field:'email',title:'Email',width:50},  
                    {field:'phone_number',title:'Phone Number',width:50}  
                ]];
            var urlEnd = 'Employee'
        </script>
    </head>
    <body>
        <table id="dg" class="easyui-datagrid">
        </table>

        <div id="dlg" class="easyui-dialog" data-options="buttons:'#dlg-buttons',closed:true">
            <div class="ftitle">Employee Data</div>
            <form id="fm" method="post" novalidate>
                <div class="easyui-accordion" data-options="fit:true,border:false" style="background-color:transparent;height:375px">
                    <div title="Personal Data" data-options="selected:true" style="padding:10px;overflow:auto;">
                        <div class="fitem">
                            <label>Employee ID:</label>
                            <input class="easyui-validatebox" name="id" data-options="required:true">
                        </div>
                        <div class="fitem">
                            <label>First Name:</label>
                            <input class="easyui-validatebox" name="first_name" data-options="required:true">
                        </div>
                        <div class="fitem">
                            <label>Last Name:</label>
                            <input class="easyui-validatebox" name="last_name" data-options="required:true">
                        </div>
                        <div class="fitem">
                            <label>Gender:</label>
                            <select id="cc" class="easyui-combobox" name="gender" data-options="panelHeight:'auto',required:true" style="width:150px">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="fitem">
                            <label>Birthday:</label>
                            <input id="dd"  class="easyui-datebox" name="birthday" data-options="required:true" style="width:150px">
                        </div>
                        <div class="fitem">
                            <label>Job:</label>
                            <input class="easyui-combobox" name="job" data-options="url:'../GetsJob',valueField:'id',textField:'title',panelHeight:'auto'" style="width:150px">
                        </div>
                        <div class="fitem">
                            <label>Department:</label>
                            <input class="easyui-combobox" name="department" data-options="url:'../GetsDepartment',valueField:'id',textField:'name',panelHeight:'auto'" style="width:150px">
                        </div>
                        <div class="fitem">
                            <label>Photo:</label>
                            <input type="file" name="url_photo" accept="image/jpg">
                        </div> 
                    </div>
                    <div title="Domicile" style="padding:10px;">
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
                    </div>
                    <div title="Contact Information" style="padding:10px;">
                        <div class="fitem">
                            <label>Email:</label>
                            <input class="easyui-validatebox" name="email" data-options="required:true,validType:'email'">
                        </div>
                        <div class="fitem">
                            <label>Phone:</label>
                            <input class="easyui-validatebox" name="phone_number" type="tel" maxlength="14" data-options="required:true"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>