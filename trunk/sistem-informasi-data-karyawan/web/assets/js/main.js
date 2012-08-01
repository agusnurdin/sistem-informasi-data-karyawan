/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function addTab(title, url){  
    if ($('#tt').tabs('exists', title)){  
        $('#tt').tabs('select', title);  
    } else {  
        var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:99%;"></iframe>';  
        $('#tt').tabs('add',{  
            title:title,  
            content:content,  
            closable:true  
        });  
    }  
}

$.fn.datebox.defaults.formatter = function(date){
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
};
$.fn.datebox.defaults.parser = function(s){
    if (!s) return new Date();
    var ss = s.split('-');
    var y = parseInt(ss[0],10);
    var m = parseInt(ss[1],10);
    var d = parseInt(ss[2],10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
        return new Date(y,m-1,d);
    } else {
        return new Date();
    }
};
    
var url;
$(function(){
    $('#dg').datagrid({
        title:'Table Data',
        iconCls:'icon-save',
        height:500,
        nowrap: true,
        autoRowHeight: false,
        fitColumns:true,
        singleSelect:true,
        striped: true,
        collapsible:true,
        url:'../Gets'+urlEnd,
        sortName: 'id',
        sortOrder: 'desc',
        remoteSort: false,
        idField:'id',
        columns:colTable,
        pagination:true,
        rownumbers:true,
        toolbar:[{
            id:'btninsert',
            text:'Insert',
            iconCls:'icon-add',
            handler:function(){
                $('#dlg').dialog('open').dialog('setTitle','Insert Data');
                $('#fm').form('clear');
                url = '../Insert'+urlEnd;
            }
        },{
            id:'btnupdate',
            text:'Update',
            iconCls:'icon-edit',
            handler:function(){
                var row = $('#dg').datagrid('getSelected');  
                if (row){  
                    $('#dlg').dialog('open').dialog('setTitle','Update Data');  
                    $('#fm').form('load',row);
                    if(urlEnd=='Employee'){
                        $('job').combobox('setValue',row.job);
                        $('department').combobox('setValue',row.department);
                    }else if(urlEnd=='Department'){
                        $('manager').combobox('setValue',row.manager);
                    }
                    url = '../Update'+urlEnd+'?id='+row.id;
                }  
            }
        },{
            id:'btndelete',
            text:'Delete',
            iconCls:'icon-remove',
            handler:function(){
                var row = $('#dg').datagrid('getSelected');  
                if (row){  
                    $.messager.confirm('Confirm','Are you sure you want to remove this user?',function(r){  
                        if (r){  
                            $.post('../Delete'+urlEnd,{
                                id:row.id
                            },function(result){  
                                if (result.success){  
                                    $('#dg').datagrid('reload');
                                } else {  
                                    $.messager.show({
                                        title: 'Error',  
                                        msg: 'Some errors occured'  
                                    });  
                                }  
                            },'json');  
                        }  
                    });  
                }  
            }
        },{
            id:'ss'
        }]
    });
});

$(function(){
    $('#ss').searchbox({  
        searcher:function(value){  
            $('#dg').datagrid('load',{  
                filter: value  
            }); 
        }, 
        prompt:'Search Data'  
    }); 
})

$(function(){
    $('#dlg').dialog({
        buttons:[{
            text:'Save',
            iconCls:'icon-ok',
            handler:function(){
                $('#fm').form('submit',{  
                    url: url,  
                    onSubmit: function(){  
                        return $(this).form('validate');  
                    },  
                    success: function(result){  
                        var result = eval('('+result+')');  
                        if (result.success){  
                            $('#dlg').dialog('close');
                            $('#dg').datagrid('reload');
                            $.messager.show({  
                                title: 'Result',  
                                msg: 'Data saved'  
                            });
                        } else {  
                            $.messager.show({  
                                title: 'Error',  
                                msg: 'Some errors occured'  
                            });  
                        }  
                    }  
                });
            }
        },{
            text:'Cancel',
            handler:function(){
                $('#dlg').dialog('close');
            }
        }]
    });
});

function updateUser(){
    $('#fm').form('submit',{  
        url: '../UpdateUsers',  
        onSubmit: function(){  
            return $(this).form('validate');  
        },  
        success: function(result){  
            var result = eval('('+result+')');  
            if (result.success){  
                $.messager.show({  
                    title: 'Result',  
                    msg: 'Profile updated'  
                });
            } else {  
                $.messager.show({  
                    title: 'Error',  
                    msg: 'Some errors occured'  
                });  
            }  
        }  
    });
}