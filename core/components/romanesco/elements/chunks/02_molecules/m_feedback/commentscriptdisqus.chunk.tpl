<script>
    /**
     *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT
     *  THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR
     *  PLATFORM OR CMS.
     *
     *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT:
     *  https://disqus.com/admin/universalcode/#configuration-variables
     */
    var disqus_config = function () {
        this.page.url = '[[~[[*id]]? &scheme=`full`]]';
        this.page.identifier = '[[*id]]';
    };
    (function() {
        var d = document, s = d.createElement('script');
        s.src = 'https://[[++disqus_shortname]].disqus.com/embed.js';
        s.setAttribute('data-timestamp', +new Date());
        (d.head || d.body).appendChild(s);
    })();
</script>