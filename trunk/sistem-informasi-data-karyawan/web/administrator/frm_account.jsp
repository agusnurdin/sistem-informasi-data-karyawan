<%-- 
    Document   : frm_account
    Created on : Jul 27, 2012, 7:31:38 PM
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
           
            var urlInsert = '../UpdateUsers';
            var urlUpdate= '../UpdateUsers?id=';       
        </script>
    </head>
    <body>
        <div id="dlg" class="easyui-panel" style="width:450px;padding:10px 20px">
            <div class="ftitle">Administrator Data</div>
            <form id="fm" method="post" novalidate>
                <div class="fitem">
                    <label>Username:</label>
                    <input class="easyui-validatebox" name="username" required="true">
                </div>
                <div class="fitem">
                    <label>Password:</label>
                    <input class="easyui-validatebox" name="password" required="true">
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
                    <select id="cc" class="easyui-combobox" name="gender" required="true" style="width:150px">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
                <div class="fitem">
                    <label>Birthday:</label>
                    <input id="dd"  class="easyui-datebox" name="birthday" required="true" style="width:150px">
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
                    <input class="easyui-validatebox" name="phone_number" type="tel" maxlength="14" required="true"/>
                </div>
                <div class="fitem">
                    <label>Job:</label>
                    <input class="easyui-combobox" name="job" url="../GetsJob" valueField="id" textField="title" panelHeight="auto" style="width:150px">
                </div>
                <div class="fitem">
                    <label>Department:</label>
                    <input class="easyui-combobox" name="department" url="../GetsDepartment" valueField="id" textField="name" panelHeight="auto" style="width:150px">
                </div>
                <div class="fitem">
                    <label>Photo:</label>
                    <input type="file" name="url_photo" accept="image/jpg" value="../file/images/default.jpg">
                </div>
            </form>
        </div>
        <div id="dlg-panel">
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveData()">Save</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
        </div>
    </body>
</html>
