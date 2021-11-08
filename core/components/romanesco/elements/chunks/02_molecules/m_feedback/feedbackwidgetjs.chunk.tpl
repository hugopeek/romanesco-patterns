<script type='text/javascript'>
    (function() {
        window.ybug_settings = {
            id: "[[+project_id]]",
            feedback: {
                name: "[[+username]]",
                email: '[[+email]]'
            },
            translate: {
                "launcherButton.Title": "[[%romanesco.feedback.button_text]]",
            }
        };
        var ybug = document.createElement('script'); ybug.type = 'text/javascript'; ybug.async = true;
        ybug.src = 'https://widget.ybug.io/button/'+window.ybug_settings.id+'.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ybug, s);
    })();
</script>