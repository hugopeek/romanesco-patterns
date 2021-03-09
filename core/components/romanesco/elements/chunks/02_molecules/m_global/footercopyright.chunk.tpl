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
            <a class="ui mini image with tooltip onclick" data-position="top right">
                [[svgSanitize?
                    &file=`assets/semantic/dist/themes/romanesco/assets/icons/romanesco-badge.svg`
                    &title=`[[%romanesco.footer.qredits_title]]`
                ]]
            </a>
            <div class="ui popup">
                [[++qredits_text:empty=`[[%romanesco.footer.qredits_text]]`]]
                <a href="https://romanesco.info/" class="ui tiny compact fluid primary button" target="_blank">
                    [[%romanesco.footer.qredits_romanesco]]
                </a>
                <a href="https://modx.com/content-management-framework" class="ui tiny compact fluid basic icon button" target="_blank">
                    <i class="modx icon"></i>
                    [[%romanesco.footer.qredits_modx]]
                </a>
            </div>
        </div>
        `]]
    </div>
</div>
