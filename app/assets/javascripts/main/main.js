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
