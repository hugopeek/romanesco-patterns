[[modifiedIf?
    &subject=`[[getRawTVValue? &tv=`footer_cta_background`]]`
    &operator=`EQ`
    &operand=`@INHERIT`
    &then=`[[[[#[[*parent]].footer_inheritance:contains=`inherit_cta_background`:then=`*footer_cta_background:empty=`[[++cta_background_default]]``:else=`++cta_background_default`]]]]`
    &else=`[[*footer_cta_background]]`
    &toPlaceholder=`footer_cta_background`
]]

<footer id="final-call" class="ui center aligned vertical stripe segment [[+footer_cta_background]] cta">
    [[#[[*footer_cta:empty=`0`]].content]]
</footer>