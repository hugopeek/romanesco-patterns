[[getContextSetting:default=`[[++google_analytics_ua]]`:toPlaceholder=`ua_code`?
    &context=`[[*context_key]]`
    &setting=`google_analytics_ua`
]]

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=[[+ua_code]]"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', '[[+ua_code]]');
</script>
