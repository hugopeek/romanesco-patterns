<!DOCTYPE html>
<html lang="[[++cultureKey]]">

[[!setUserPlaceholders? &userId=`[[*article_author]]`]]
[[-!Hits? &punch=`[[*id]]`]]

[[$head]]

<body id="blog">

<div class="pusher">
    [[$headerBasic?
        &masthead=`0`
        &hero=`1`
        &search=`0`
    ]]

    <main id="main" role="main">
        <article id="content">

            <div class="ui text container">
                <div class="ui two column grid">
                    <div class="column">
                        <a href="[[~[[*parent]]]]" class="basic ui button"><i class="icon left arrow"></i>Alle artikelen</a>
                    </div>
                    <div class="right aligned column">
                        [[!$socialShareButtons? &button_type=`basic`]]
                    </div>
                </div>
            </div>

            <div class="ui introduction text container">
                <h1 class="ui huge header">[[*pagetitle]]</h1>
                <p class="meta date"><em>[[*publishedon:strtotime:date=`%e %B %Y`]]</em></p>
            </div>

            [[*content]]

        </article>

        <aside class="ui text container">
            [[*article_comments:isnot=`0`:then=`
            <div id="disqus_thread"></div>
            <script>
                /**
                 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
                 */
                 var disqus_config = function () {
                 this.page.url = '[[~[[*id]]? &scheme=`full`]]';  // Replace PAGE_URL with your page's canonical URL variable
                 this.page.identifier = '[[*id]]'; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                 };

                (function() {  // DON'T EDIT BELOW THIS LINE
                    var d = document, s = d.createElement('script');

                    s.src = '//ctmeter.disqus.com/embed.js';

                    s.setAttribute('data-timestamp', +new Date());
                    (d.head || d.body).appendChild(s);
                })();
            </script>
            <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
            `]]
        </aside>

        <div class="ui vertical stripe segment white">
            <div class="ui text container">
                <div class="ui two column grid">
                    <div class="column">
                        <a href="[[~[[*parent]]]]" class="primary ui button"><i class="icon left arrow"></i>Alle artikelen</a>
                    </div>
                    <div class="right aligned column">
                        [[!$socialShareButtons]]
                    </div>
                </div>
            </div>
            
            <div class="ui container">
                <aside class="column">
                    
                </aside>
            </div>
        </div>
    </main>

    [[$footer]]
</div>

[[$offCanvasNav]]
[[$script]]

</body>
</html>