<script>
    window.addEventListener('DOMContentLoaded', function() {
        $('.ui.form#form-test-example').submit(function (event) {
            event.preventDefault();
            var formData = $(this).serialize();

            $.ajax({
                type: "POST",
                url: "https://global.romanesco-nursery.loc/forms/test-example?mode=ajax",
                data: formData,
                dataType: "json",
                encode: true,
            }).done(function (data) {
                // If we receive a success message, show an alert.
                if (data.success) {
                    console.log(data.success);

                    // $('body')
                    //     .toast({
                    //         message: data.message,
                    //         class: 'success',
                    //         showIcon: 'checkmark',
                    //         //displayTime: 0,
                    //         //closeIcon: true
                    //     })
                    // ;
                    $('.ui.form#form-test-example .dimmer').addClass('active');

                    setTimeout(function () {
                        $('.ui.form#form-test-example > div')
                            .replaceWith('<div class="ui success message">' + data.message + '<\/div>')
                        ;
                    }, 2000)

                } else {
                    console.log(data.errors);

                    $.each(data.errors, function(key, item) {
                        console.log(item);

                        $('body')
                            .toast({
                                message: key + '<br>' + item,
                                class: 'error',
                                showIcon: 'exclamation circle',
                                //displayTime: 0,
                                closeIcon: true
                            })
                        ;

                        //$("#" + key).parent('.field').addClass('error');
                    });


                }
            });
        });
    });
</script>

[[loadAssets? &component=`toast`]]
[[loadAssets? &component=`loader`]]
[[loadAssets? &component=`dimmer`]]