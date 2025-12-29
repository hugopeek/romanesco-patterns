[[If?
    &subject=`[[getRawTVValue? &tv=`footer_cta_background`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[#[[*parent]].footer_inheritance:contains=`inherit_cta_background`:then=`[[*footer_cta_background:empty=`[[++cta_background_default]]`]]`:else=`[[++cta_background_default]]`]]`
    &else=`[[*footer_cta_background]]`
    &toPlaceholder=`footer_cta_background`
]]

<aside id="final-call" class="ui vertical stripe segment [[setBackground? &background=`[[+footer_cta_background]]`]] cta">
    <div class="ui center aligned main container">
        [[renderResources?
            &parents=`-1`
            &resources=`[[*footer_cta]]`
        ]]
    </div>
</aside>