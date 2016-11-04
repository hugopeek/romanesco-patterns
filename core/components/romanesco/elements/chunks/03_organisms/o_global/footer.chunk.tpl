<footer id="footer" class="ui vertical segment inverted">
    [[#[[++footer_id:empty=`[[++romanesco.global_footer_id]]`]].content]]

    <div class="ui container section divider"></div>

    <div class="ui grid container">
        <div class="four wide column">
            <p>&copy; [[Time:date=`%Y`]] - [[++site_name]]</p>
        </div>

        <div class="twelve wide column right aligned">
            <div class="ui horizontal inverted list">
                [[pdoMenu?
                    &parents=`[[++common_pages_id:empty=`[[++romanesco.common_pages_id]]`]]`
                    &level=`0`
                    &tplOuter=`navWrapper`
                    &tpl=`navItem`
                    &sortby=`menuindex`
                    &sortdir=`ASC`
                ]]
            </div>
        </div>
    </div>
</footer>