<div class="ui container section divider"></div>

<div class="ui equal width grid container">
    <div class="fitted column">
        <p>&copy; [[Time:date=`%Y`]]<span class="tablet or lower hidden"> - [[++site_name]]</span></p>
    </div>

    <div class="right aligned column">
        <div class="ui horizontal list">
            [[pdoMenu?
                &parents=`[[++common_pages_id:empty=`[[++romanesco.common_pages_id:empty=`0`]]`]]`
                &level=`0`
                &tplOuter=`navWrapper`
                &tpl=`navItem`
                &sortby=`menuindex`
                &sortdir=`ASC`
            ]]
        </div>
    </div>
</div>