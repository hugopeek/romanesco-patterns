<footer id="footer" class="ui vertical segment inverted">
    [[#[[++footer_id:empty=`[[++romanesco.global_footer_id]]`]].content]]

    <div class="ui container section divider"></div>

    <div class="ui grid container">
        <div class="four wide column">
            <p>&copy; [[Time:date=`%Y`]] - [[++site_name]]</p>
        </div>
        
        <div class="twelve wide column right aligned">
            <div class="ui horizontal inverted bulleted list">
                [[getResources?
                    &parents=`[[++common_pages_id:empty=`[[++romanesco.common_pages_id]]`]]`
                    &depth=`0`
                    &limit=`6`
                    &tpl=`@INLINE <a class="item" href="[[!~[[+id]]]]">[[+menutitle:empty=`[[+pagetitle]]`]]</a>`
                    &sortby=`menuindex`
                    &sortdir=`ASC`
                ]]
            </div>
        </div>
    </div>
</footer>