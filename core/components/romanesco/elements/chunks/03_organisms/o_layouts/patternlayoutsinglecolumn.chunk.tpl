<div class="ui vertical stripe segment [[+background]]">
    <div class="ui [[+container_type]] [[+alignment]] container">
        <div class="ui two column middle aligned equal width grid">
            <div class="column">
                [[$headingBasicAnchor?
                    &level=`h2`
                    &value=`[[+pattern_name]]`
                    &alignment=`middle aligned`
                ]]
            </div>

            <div class="five wide right aligned column">
                <i class="unhide link icon visibility toggle" data-target="preview-[[+unique_idx]]" data-state="visible"></i>
                <i class="code link icon visibility toggle disabled" data-target="code-[[+unique_idx]]" data-state="hidden"></i>

                [[$buttonHrefIcon?
                    &classes=`small primary`
                    &icon_class=`lab`
                    &button_text=`Backyard`
                ]]
            </div>
        </div>

        <div class="ui divider"></div>

        <div class="ui nested stackable doubling equal width grid">
            <div class="row">
                <div id="preview-[[+unique_idx]]" class="[[+sidebar_width]] wide column visible element">
                    [[+preview]]
                </div>
                <div id="code-[[+unique_idx]]" class="column hidden element">
                    [[+code]]
                </div>
            </div>
        </div>

        [[+info]]
    </div>
</div>