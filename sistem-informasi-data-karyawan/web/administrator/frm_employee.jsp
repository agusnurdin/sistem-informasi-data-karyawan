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
        </style>
        <script type="text/javascript">
            $.fn.datebox.defaults.formatter = function(date){
                var y = date.getFullYear();
                var m = date.getMonth()+1;
                var d = date.getDate();
                return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
            };
            $.fn.datebox.defaults.parser = function(s){
                if (!s) return new Date();
                var ss = s.split('-');
                var m = parseInt(ss[0],10);
                var d = parseInt(ss[1],10);
                var y = parseInt(ss[2],10);
                if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
                    return new Date(y,m-1,d);
                } else {
                    return new Date();
                }
            };
           
            var urlInsert = '../InsertEmployee';
            var urlUpdate= '../UpdateEmployee?id=';
            var urlDelete = '../DeleteEmployee';           
        </script>
    </head>
    <body>
        <table id="dg" title="Table Data" class="easyui-datagrid" style="width:auto;height:auto"
               url="../GetsEmployee"
               toolbar="#toolbar" pagination="true"
               rownumbers="true" fitColumns="true" singleSelect="true">
            <thead>
                <tr>
                    <th field="id" width="50">ID</th>
                    <th field="full_name" width="50">First Name</th>
                    <th field="job" width="50">Job</th>
                    <th field="department" width="50">Department</th>
                </tr>
            </thead>
        </table>

        <%@include file="../WEB-INF/jspf/toolbar.jspf" %>

        <div id="dlg" class="easyui-dialog" style="width:450px;padding:10px 20px"
             closed="true" buttons="#dlg-buttons">
            <div style="float:left">
                <img style="width:100px;height:100px;margin:10px;display:block" src="../file/images/default.jpg"/>
            </div>
            <div class="ftitle">Employee Data</div>
            <form id="fm" method="post" novalidate>
                <div class="fitem">
                    <label>Employee ID:</label>
                    <input class="easyui-validatebox" name="id" required="true">
                </div>
                <div class="fitem">
                    <label>First Name:</label>
                    <input class="easyui-validatebox" name="first_name" required="true">
                </div>
                <div class="fitem">
                    <label>Last Name:</label>
                    <input class="easyui-validatebox" name="last_name" required="true">
                </div>
                <div class="fitem">
                    <label>Gender:</label>
                    <select id="cc" class="easyui-combobox" name="gender" required="true">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
                <div class="fitem">
                    <label>Birthday:</label>
                    <input id="dd"  class="easyui-datebox" name="birthday" required="true">
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
                <div class="fitem">
                    <label>Email:</label>
                    <input class="easyui-validatebox" name="email" validType="email" required="true">
                </div>
                <div class="fitem">
                    <label>Phone:</label>
                    <input id="nn" class="easyui-numberbox" name="phone_number" maxlength="14" required="true"/>
                </div>
                <div class="fitem">
                    <label>Job:</label>
                    <input class="easyui-combobox" name="job" url="../GetsJob" valueField="id" textField="title" panelHeight="auto">
                </div>
                <div class="fitem">
                    <label>Department:</label>
                    <input class="easyui-combobox" name="department" url="../GetsDepartment" valueField="id" textField="name" panelHeight="auto">
                </div>
                <div class="fitem">
                    <label>Photo:</label>
                    <input type="file" name="url_photo" accept="image/jpg" value="../file/images/default.jpg">
                </div>
            </form>
        </div>
        <div id="dlg-buttons">
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveData()">Save</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
        </div>
    </body>
</html>