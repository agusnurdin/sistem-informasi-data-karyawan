<%-- 
    Document   : frm_users
    Created on : Jul 30, 2012, 6:29:34 PM
    Author     : Luckma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    model.Users user = new dao.UsersDAOImpl(utils.PersistenceUtil.getEntityManager()).get((Long) session.getAttribute("user"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../WEB-INF/jspf/custom.jspf" %>
        <script>
            $(function(){
                $('gender').combobox('setValue','<%= user.getEmployee().getGender()%>');
                $('job').combobox('setValue','<%= user.getEmployee().getJob().getId()%>');           
                $('department').combobox('setValue','<%= user.getEmployee().getDepartment().getId()%>');
            }
        </script>
    </head>
    <body>
        <div class="easyui-panel" style="width:450px;padding:10px 20px">
            <div class="ftitle">Administrator Data</div>
            <form id="fm" method="post" novalidate>
                <div class="fitem">
                    <label>Username:</label>
                    <input class="easyui-validatebox" name="username" data-options="required:true" value="<%= user.getUsername()%>">
                </div>
                <div class="fitem">
                    <label>Password:</label>
                    <input class="easyui-validatebox" name="password" data-options="required:true" value="<%= user.getPassword()%>">
                </div>
                <div class="fitem">
                    <label>First Name:</label>
                    <input class="easyui-validatebox" name="first_name" data-options="required:true" value="<%= user.getEmployee().getFirst_name()%>">
                </div>
                <div class="fitem">
                    <label>Last Name:</label>
                    <input class="easyui-validatebox" name="last_name" data-options="required:true" value="<%= user.getEmployee().getLast_name()%>">
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
                    <input id="dd" class="easyui-datebox" name="birthday" data-options="required:true" style="width:150px" value="<%= user.getEmployee().getBirthday()%>">
                </div>

                <div class="fitem">
                    <label>Street Address:</label>
                    <input class="easyui-validatebox" name="street_address" data-options="required:true" value="<%= user.getEmployee().getDomicile().getStreet_address()%>">
                </div>
                <div class="fitem">
                    <label>Postal Code:</label>
                    <input class="easyui-validatebox" name="postal_code" data-options="required:true" value="<%= user.getEmployee().getDomicile().getPostal_code()%>">
                </div>
                <div class="fitem">
                    <label>City:</label>
                    <input class="easyui-validatebox" name="city" data-options="required:true" value="<%= user.getEmployee().getDomicile().getCity()%>">
                </div>
                <div class="fitem">
                    <label>State Province:</label>
                    <input class="easyui-validatebox" name="state_province" data-options="required:true" value="<%= user.getEmployee().getDomicile().getState_province()%>">
                </div>
                <div class="fitem">
                    <label>Country:</label>
                    <input class="easyui-validatebox" name="country" data-options="required:true" value="<%= user.getEmployee().getDomicile().getCountry()%>">
                </div>
                <div class="fitem">
                    <label>Email:</label>
                    <input class="easyui-validatebox" name="email" data-options="required:true,validType:'email'" value="<%= user.getEmployee().getEmail()%>">
                </div>
                <div class="fitem">
                    <label>Phone:</label>
                    <input class="easyui-validatebox" name="phone_number" type="tel" maxlength="14" data-options="required:true" value="<%= user.getEmployee().getPhone_number()%>"/>
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
            </form>
        </div>
        <div class="easyui-panel">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="updateUser()">Save</a>
        </div>
    </body>
</html>