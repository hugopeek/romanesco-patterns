<footer id="footer" class="ui vertical segment inverted">
    [[#[[[[++footer_id:empty=`++patternlab.global_footer_id`]]]].content]]

    <div class="ui container section divider"></div>

    <div class="ui grid container">
        <div class="four wide column">
            <p>&copy; [[Time:date=`%Y`]] - [[++site_name]]</p>
        </div>
        
        <div class="eight wide column center aligned">
            <div class="ui horizontal inverted bulleted list">
                [[getResources?
                    &parents=`[[++common_pages_id]]`
                    &depth=`0`
                    &limit=`6`
                    &tpl=`@INLINE <a class="item" href="[[!~[[+id]]]]">[[+menutitle:empty=`[[+pagetitle]]`]]</a>`
                    &sortby=`menuindex`
                    &sortdir=`ASC`
                ]]
            </div>
        </div>

        <div class="four wide column right aligned">
            <p><a class="q-box" title="[[%patternlab.footer.qredits_title]]" href="http://websitelikethis.com" target="_blank">WebsiteLikeThis</a></p>
        </div>
    </div>
</footer>