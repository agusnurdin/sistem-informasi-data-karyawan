<%-- 
    Document   : frm_employee
    Created on : Jul 11, 2012, 9:14:30 PM
    Author     : Luckma
--%>

<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.EmployeeDAOImpl"%>
<%@page import="dao.EmployeeDAO"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
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
            var url;
            function newData(){
                $('#dlg').dialog('open').dialog('setTitle','New Employee');
                $('#fm').form('clear');
                url = 'save_user.php';
            }
            function updateData(){
                var row = $('#dg').datagrid('getSelected');
                if (row){
                    $('#dlg').dialog('open').dialog('setTitle','Edit Employee');
                    $('#fm').form('load',row);
                    url = 'update_user.php?id='+row.id;
                }
            }
            function insertData(){
                $('#fm').form('submit',{
                    url: url,
                    onSubmit: function(){
                        return $(this).form('validate');
                    },
                    success: function(result){
                        var result = eval('('+result+')');
                        if (result.success){
                            $('#dlg').dialog('close');		// close the dialog
                            $('#dg').datagrid('reload');	// reload the user data
                        } else {
                            $.messager.show({
                                title: 'Error',
                                msg: result.msg
                            });
                        }
                    }
                });
            }
            function deleteData(){
                var row = $('#dg').datagrid('getSelected');
                if (row){
                    $.messager.confirm('Confirm','Are you sure you want to remove this user?',function(r){
                        if (r){
                            $.post('remove_user.php',{id:row.id},function(result){
                                if (result.success){
                                    $('#dg').datagrid('reload');	// reload the user data
                                } else {
                                    $.messager.show({	// show error message
                                        title: 'Error',
                                        msg: result.msg
                                    });
                                }
                            },'json');
                        }
                    });
                }
            }
        </script>
    </head>
    <body>
        <table id="dg" title="Table Employee" class="easyui-datagrid" style="width:auto;height:auto"
               url="#"
               toolbar="#toolbar" pagination="true"
               rownumbers="true" fitColumns="true" singleSelect="true">
            <thead>
                <tr>
                    <th field="employee_id" width="50">Employee ID</th>
                    <th field="full_name" width="50">Full Name</th>
                    <th field="job" width="50">Job</th>
                    <th field="department" width="50">Department</th>
                </tr>
            </thead>
            <tbody>
                <%
                    /*
                     * try { EntityManagerFactory emf =
                     * Persistence.createEntityManagerFactory("sistem-informasi-data-karyawanPU");
                     * EntityManager em = emf.createEntityManager();
                     *
                     * EmployeeDAO dao = new EmployeeDAOImpl(em); List<Employee>
                     * list = new ArrayList<Employee>(); list = dao.gets(); for
                     * (Employee o : list) { out.print("<tr>"); out.print("<td>"
                     * + o.getId() + "</td>"); out.print("<td>" +
                     * o.getFirst_name() + " " + o.getLast_name() + "</td>");
                     * out.print("<td>" + o.getJob().getTitle() + "</td>");
                     * out.print("<td>" + o.getDepartment().getName() +
                     * "</td>"); out.print("</tr>"); } } catch (Exception ex) {
                     * out.print("<tr>"); out.print("<td colspan=\"5\">Can't
                     * Connect Database Please Refreash</td>");
                     * out.print("</tr>"); }
                     */
                %>
            </tbody>
        </table>

        <%@include file="../WEB-INF/jspf/toolbar.jspf" %>

        <div id="dlg" class="easyui-dialog" style="width:450px;padding:10px 20px"
             closed="true" buttons="#dlg-buttons">
            <div class="ftitle">Employee Data</div>
            <form id="fm" method="post" novalidate>
                <div class="fitem">
                    <label>Employee ID:</label>
                    <input class="easyui-validatebox" name="employee_id" required="true">
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
                    <input id="dd" class="easyui-datebox" name="birthday" required="true">
                </div>
                <div class="fitem">
                    <label>Domicile:</label>
                </div>
                <div class="fitem">
                    <label>Photo:</label>
                    <input type="file" name="url_photo" accept="image/png">
                </div>
                <div class="fitem">
                    <label>Email:</label>
                    <input class="easyui-validatebox" name="email" validType="email">
                </div>
                <div class="fitem">
                    <label>Phone:</label>
                    <input class="easyui-validatebox" name="phone_number">
                </div>
                <div class="fitem">
                    <label>Job:</label>
                    <select id="cc" class="easyui-combobox" name="job" required="true">

                    </select>
                </div>
                <div class="fitem">
                    <label>Department:</label>
                    <select id="cc" class="easyui-combobox" name="department" required="true">

                    </select>
                </div>
            </form>
        </div>
        <div id="dlg-buttons">
            <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">Save</a>
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
        </div>
    </body>
</html>