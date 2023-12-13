<script>
    window.addEventListener('DOMContentLoaded', function() {
        $('.ui.form').visibility({
            once: true,
            onTopVisible: function () {
                let script = document.createElement('script');
                script.src = 'https://www.google.com/recaptcha/api.js?render=[[++recaptchav3.site_key]]&hl=[[++cultureKey]]';
                script.defer = true;

                if ($('script[src="' + script.src + '"]').length === 0) {
                    document.head.appendChild(script);
                }
            }
        });
    });
</script>