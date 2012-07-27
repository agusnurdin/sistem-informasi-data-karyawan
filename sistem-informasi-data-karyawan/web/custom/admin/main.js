/*==========*/
/* =base URL*/  
/*==========*/
function getBaseUrl(){
    return window.location.protocol + "//" +window.location.hostname + "//";
}



/*==========*/
/* =messager */
/*==========*/
function messager(msg){
    $(function(){
	var notice = '<div class="notice">'
	+ '<div class="notice-body">'
	+ '<img src="'+getBaseUrl()+'/images/purr/info.png" alt="" />'
	+ '<h3>Laporan!</h3>'
	+ '<p>'+msg+'</p>'
	+ '</div>'
	+ '<div class="notice-bottom">'
	+ '</div>'
	+ '</div>';

	$( notice ).purr(
	{
	    usingTransparentPNG: true
	}
	);
    })
}

//validation
$(function(){
    $("form").validate();
})


/**
 * Tiny MCE
 */
tinyMCE.init({
    // General options
    mode : "textareas",
    theme : "advanced",
    plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

    // Theme options
    theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
    theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
    theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
    theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,spellchecker,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,blockquote,pagebreak,|,insertfile,insertimage",
    theme_advanced_toolbar_location : "top",
    theme_advanced_toolbar_align : "left",
    theme_advanced_statusbar_location : "bottom",
    theme_advanced_resizing : true,

    // Skin options
    skin : "o2k7",
    skin_variant : "silver",

    // Example content CSS (should be your site CSS)
    content_css : "css/example.css",

    // Drop lists for link/image/media/template dialogs
    template_external_list_url : "js/template_list.js",
    external_link_list_url : "js/link_list.js",
    external_image_list_url : "js/image_list.js",
    media_external_list_url : "js/media_list.js"

// Replace values for the template plugin

});


/**
 * Checkbox styling script
 */
$(function(){
    $('input').checkBox();
    $('#toggle-all').click(function(){
        $('#toggle-all').toggleClass('toggle-checked');
        $('#mainform input[type=checkbox]').checkBox('toggle');
        return false;
    });
});

/**
 * styled select box script version 1
 */
$(document).ready(function() {
    $('.styledselect').selectbox({
        inputClass: "selectbox_styled"
    });
});

$(document).ready(function() {
    $('.styledselect_form_1').selectbox({
        inputClass: "styledselect_form_1"
    });
    $('.styledselect_form_2').selectbox({
        inputClass: "styledselect_form_2"
    });
});

$(document).ready(function() {
    $('.styledselect_pages').selectbox({
        inputClass: "styledselect_pages"
    });
});

/**
 * styled file upload script
 */
$(function() {
    $("input.file_1").filestyle({
        image: getBaseUrl()+"images_admin/forms/upload_file.gif",
        imageheight : 29,
        imagewidth : 78,
        width : 300
    });
});

/**
 * Tooltips
 */
$(function() {
    $('a.info-tooltip ').tooltip({
        track: true,
        delay: 0,
        fixPNG: true,
        showURL: false,
        showBody: " - ",
        top: -35,
        left: 5
    });
});

/**
 * Date picker
 */

$(function()
{

    // initialise the "Select date" link
    $('#date-pick')
    .datePicker(
    // associate the link with a date picker
    {
        createButton:false,
        startDate:'01/01/2005',
        endDate:'31/12/2020'
    }
    ).bind(
        // when the link is clicked display the date picker
        'click',
        function()
        {
            updateSelects($(this).dpGetSelected()[0]);
            $(this).dpDisplay();
            return false;
        }
        ).bind(
        // when a date is selected update the SELECTs
        'dateSelected',
        function(e, selectedDate, $td, state)
        {
            updateSelects(selectedDate);
        }
        ).bind(
        'dpClosed',
        function(e, selected)
        {
            updateSelects(selected[0]);
        }
        );

    var updateSelects = function (selectedDate)
    {
        var selectedDate = new Date(selectedDate);
        $('#d option[value=' + selectedDate.getDate() + ']').attr('selected', 'selected');
        $('#m option[value=' + (selectedDate.getMonth()+1) + ']').attr('selected', 'selected');
        $('#y option[value=' + (selectedDate.getFullYear()) + ']').attr('selected', 'selected');
    }
    // listen for when the selects are changed and update the picker
    $('#d, #m, #y')
    .bind(
        'change',
        function()
        {
            var d = new Date(
                $('#y').val(),
                $('#m').val()-1,
                $('#d').val()
                );
            $('#date-pick').dpSetSelected(d.asString());
        }
        );

    // default the position of the selects to today
    var today = new Date();
    updateSelects(today.getTime());

    // and update the datePicker to reflect it...
    $('#d').trigger('change');
});


/**
 * Delete Dialog
 */
//deleteDialog
function confirmDeleteAll(){
    $(function() {					
	$( "#dialog-confirm" ).dialog({
	    resizable: false,
	    height:170,
	    modal: true,
	    buttons: {
		"Yes": function() {
		    $('#mainForm').submit();        
		    $( this ).dialog( "close" );
		},
		Cancel: function() {
		    $( this ).dialog( "close" );
		}
	    }
	});
	return false;
    });

}
function confirmDelete(links){
    $(function() {					
	$( "#dialog-confirm" ).dialog({
	    resizable: false,
	    height:170,
	    modal: true,                        
	    buttons: {
		"Yes": function() {
		    location.href=links;
		    $( this ).dialog( "close" );                    
		},
		Cancel: function() {
		    $( this ).dialog( "close" );
		    return false;
		}
	    }
	});                
    });

}


$(function(){
    $('#deleteDialog').click(function(){
	confirmDeleteAll();  
	return false;
    })
    $('.delete-btn').click(function(){
	var links = $(this).attr('href');
        
	confirmDelete(links);        
	return false;
    })
})


/**
 * MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix
 */
$(document).ready(function(){
    $(document).pngFix( );
});