<div class="ui container">
    <div class="ui stackable equal width middle aligned grid center when stacked">
        <div id="copyright" class="compact column">
            <p>&copy; [[Time:date=`%Y`]]<span class="tablet or lower hidden"> - [[++site_name]]</span></p>
        </div>

        <div class="right aligned column">
            <nav id="menu-footer" class="ui horizontal list">
                [[pdoMenu?
                    &parents=`[[++common_pages_id:empty=`[[++romanesco.common_pages_id:empty=`0`]]`]]`
                    &resources=`[[+excluded_resources]]`
                    &level=`1`
                    &tplOuter=`navWrapper`
                    &tpl=`navItem`
                    &sortby=`menuindex`
                    &sortdir=`ASC`
                ]]
            </nav>
        </div>

        [[++qredits_visibility:eq=`1`:then=`
        <div id="qredits" class="compact column">
            <a href="[[++qredits_link:empty=`[[%romanesco.footer.qredits_link]]`]]"
               title="[[++qredits_title:empty=`[[%romanesco.footer.qredits_title]]`]]"
               class="ui mini image">
                <img loading="lazy" src="[[++qredits_img:empty=`[[++romanesco.qredits_img]]`]]" alt="[[%romanesco.footer.qredits_img_alt]]">
            </a>
        </div>
        `]]
    </div>
</div>
