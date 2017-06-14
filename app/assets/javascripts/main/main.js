function hideModalBoot() {
    $('#modalshowCart').modal('hide');
}

//    BEGIN ajax add city to order
$(document).ready(function () {
    $(document).on("change", "#order_city", function () {
        $.ajax({
            url: '/orders/form_render',
            type: 'POST',
            data: $(this).serialize(),
            success: function (result) {
                $('#deliveryAndPay').html(result);
                console.log(result);
            }
        });
    });
});
//    END ajax add city to order
$(document).on('ready turbolinks:load', function(){
    $('.autoplay').not('.slick-initialized').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 6000
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.autoplay2').not('.slick-initialized').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 4500
    });

});