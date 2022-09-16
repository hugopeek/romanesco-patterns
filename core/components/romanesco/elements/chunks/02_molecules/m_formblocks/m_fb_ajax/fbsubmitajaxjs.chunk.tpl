e.preventDefault();
var formData = $(this).serialize();

$.ajax({
    type: 'POST',
    url: '[[~[[*id]]? &scheme=`full` &mode=`ajax`]]',
    data: formData,
    dataType: 'json',
    encode: true,
})
.done(function(data) {
    // If we receive a success message, show an alert.
    if (data.success) {
        // Forge success message
        //let message = '[[$richTextMessage:stripForJS?
        //    &size=`[[+form_size]]`
        //    &message_type=`visible success`
        //    &heading=`[[%formblocks.form.success_heading]]`
        //    &content=`[[%formblocks.form.success_message]]`
        //]]';

        let message = '<strong>[[%formblocks.form.success_heading]]<\/strong><br>';
        message += data.message;

        // Avoid stunning the visitor by delaying the success message and showing a dimmer
        $('.ui.form#form-[[*alias]] .dimmer').addClass('active');

        setTimeout(function() {
            //$('.ui.form#form-[[*alias]] > div').replaceWith(message);

            $('.ui.form#form-[[*alias]] .dimmer').removeClass('active');
            $('.ui.form#form-[[*alias]]').form('clear');

            $('body')
                .toast({
                    message: message,
                    class: 'success',
                    //showIcon: 'exclamation circle',
                    //displayTime: 0,
                    closeIcon: true
                })
            ;
        }, 2000)
    }
    else {
        console.log(data.errors);

        let message = '<strong>[[%formblocks.form.validation_error_heading]]<\/strong><br>';
        message += '[[%formblocks.form.validation_error_message]]<br>';

        // Remove previously set error classes first
        $('.ui.form#form-[[*alias]] .field.error').removeClass('error');
        $('.ui.form#form-[[*alias]] .grouped.fields.error').removeClass('error');

        $.each(data.errors, function(key, item) {
            //message += key + '<br>';

            $('#' + key + '.field').addClass('error');
            $('#' + key + '.grouped.fields').addClass('error');
            $('#' + key).parents('.field').addClass('error');
        });

        $('body')
            .toast({
                message: message,
                class: 'error',
                //showIcon: 'exclamation circle',
                //displayTime: 0,
                closeIcon: true
            })
        ;
    }
});

[[loadAssets? &component=`toast`]]
[[loadAssets? &component=`loader`]]
[[loadAssets? &component=`dimmer`]]