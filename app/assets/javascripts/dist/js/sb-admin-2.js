$(function() {

    $('#side-menu').metisMenu();

});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).bind("load resize", function() {
        var topOffset = 50;
        var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    var url = window.location;
    var element = $('ul.nav a').filter(function() {
     return this.href == url;
    }).addClass('active').parent();

    while(true){
        if (element.is('li')){
            element = element.parent().addClass('in').parent();
        } else {
            break;
        }
    }

    $('#datetimepicker6').datetimepicker({
        format : 'YYYY-MM-DD HH:mm:ss'
    });
    $('#datetimepicker7').datetimepicker({
        useCurrent: false, //Important! See issue #1075
        format : 'YYYY-MM-DD HH:mm:ss'
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });

});

function get_data_product(orderId,url){
    $("#add-area").empty();
    $.ajax({
        type: "POST",
        url: url,
        data: {orderId: orderId},
        success: function(result) {
            $.each(result, function (key, data) {
                $("#add-area").append("<tr class='modal-body'>" +
                    "<td><img class='img-thumbnail float-left' alt='Cinque Terre' width='180'  src='"+data.avatar+"'/></td>" +
                    "<td>"+data.name+"</td>" +
                    "<td>"+Number(data.price.toFixed(1)).toLocaleString()+" VND</td>" +
                    "</tr>"
                    );
            })
        }
    });
}
