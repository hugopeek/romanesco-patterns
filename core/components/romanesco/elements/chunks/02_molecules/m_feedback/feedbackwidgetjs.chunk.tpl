<script type='text/javascript'>
    (function() {
        window.ybug_settings = {
            id: "[[+project_id:empty=`[[++romanesco.ybug_project_id]]`]]",
            launcher_position: "[[+position:empty=`right-middle`]]",
            feedback: {
                name: "[[+username:empty=`[[!+modx.user.id:userinfo=`username`]]`]]",
                email: '[[+email:empty=`[[!+modx.user.id:userinfo=`email`]]`]]'
            },
            translate: {
                "launcherButton.Title": "[[+button_text:empty=`[[%romanesco.feedback.button_text]]`]]",
            }
        };
        var ybug = document.createElement('script'); ybug.type = 'text/javascript'; ybug.async = true;
        ybug.src = 'https://widget.ybug.io/button/'+window.ybug_settings.id+'.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ybug, s);
    })();
</script>