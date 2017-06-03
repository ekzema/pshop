function initializeJS() {

    //sidebar dropdown menu
    jQuery('#sidebar .sub-menu > a').click(function () {
        var last = jQuery('.sub-menu.open', jQuery('#sidebar'));
        jQuery('.menu-arrow').removeClass('arrow_carrot-right');
        jQuery('.sub', last).slideUp(200);
        var sub = jQuery(this).next();
        if (sub.is(":visible")) {
            jQuery('.menu-arrow').addClass('arrow_carrot-right');
            sub.slideUp(200);
        } else {
            jQuery('.menu-arrow').addClass('arrow_carrot-down');
            sub.slideDown(200);
        }
        var o = (jQuery(this).offset());
        diff = 200 - o.top;
        if (diff > 0)
            jQuery("#sidebar").scrollTo("-=" + Math.abs(diff), 500);
        else
            jQuery("#sidebar").scrollTo("+=" + Math.abs(diff), 500);
    });

    // sidebar menu toggle
    jQuery(function () {
        function responsiveView() {
            var wSize = jQuery(window).width();
            if (wSize <= 768) {
                jQuery('#container').addClass('sidebar-close');
                jQuery('#sidebar > ul').hide();
            }

            if (wSize > 768) {
                jQuery('#container').removeClass('sidebar-close');
                jQuery('#sidebar > ul').show();
            }
        }

        jQuery(window).on('load', responsiveView);
        jQuery(window).on('resize', responsiveView);
    });

    document.addEventListener("turbolinks:load", function () {
        jQuery('.toggle-nav').click(function () {
            if (jQuery('#sidebar > ul').is(":visible") === true) {
                jQuery('#main-content').css({
                    'margin-left': '0px'
                });
                jQuery('#sidebar').css({
                    'margin-left': '-180px'
                });
                jQuery('#sidebar > ul').hide();
                jQuery("#container").addClass("sidebar-closed");
            } else {
                jQuery('#main-content').css({
                    'margin-left': '180px'
                });
                jQuery('#sidebar > ul').show();
                jQuery('#sidebar').css({
                    'margin-left': '0'
                });
                jQuery("#container").removeClass("sidebar-closed");
            }
        });
    });

    //bar chart
    if (jQuery(".custom-custom-bar-chart")) {
        jQuery(".bar").each(function () {
            var i = jQuery(this).find(".value").html();
            jQuery(this).find(".value").html("");
            jQuery(this).find(".value").animate({
                height: i
            }, 2000)
        })
    }

}

jQuery(document).ready(function () {
    initializeJS();
});


$(document).on('ready turbolinks:load', function () {

    $('.deleteMessage2').on("click", function () {
        var id = $(this).attr("orr_id");
        var accon = $(this).attr("accon");
        $.confirm({
            confirmButton: 'Да',
            cancelButton: 'Нет',
            title: 'Подтверждение!',
            content: 'Вы уверены что хотите удалить эту запись?',
            confirm: function () {
                $.ajax({
                    type: "delete",
                    url: "/" + accon + "/" + id,
                    data: "id=" + id,
                    cache: false,
                    success: function (data) {
                        if (data == "ok") {
                            $('#product_' + id).hide(700);
                        }
                    }
                });
            }
        });
    });

});

// BEGIN clipboardjs
$(document).on('ready turbolinks:load', function () {
    new Clipboard('.btn');
});
// END clipboardjs


// BEGIN ajax add category to ptoduct
$(document).ready(function () {

    // var img_load = '<center><img src="/loading.gif" alt=""/></center>';
    $(document).on("change", "#post_category_id", function () {
        // $('#twocategory').html(img_load);
        $.ajax({
            url: '/posts/form_render',
            type: 'POST',
            data: $(this).serialize(),
            success: function (result) {
                // if (result == '') $('#twocategory' && '#threecategory').html(result);
                $('#twocategory').html(result);
                console.log(result);
            }
        });
    });
});
//    END ajax add category to ptoduct
