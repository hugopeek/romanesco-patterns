<span class="ui labels">
    [[[[If?
        &subject=`[[+electron_type]]`
        &operator=`notempty`
        &then=`$tagItemBasic? &tag=`[[+electron_type]]``
    ]]]]
</span>
<span class="ui blue labels">
    [[[[If?
        &subject=`[[+tags_info]]`
        &operator=`notempty`
        &then=`parseTags? &input=`[[+tags_info]]` &tpl=`tagItemIcon` &iconClass=`info``
    ]]]]
</span>
<span class="ui red labels">
    [[[[If?
        &subject=`[[+tags_warning]]`
        &operator=`notempty`
        &then=`parseTags? &input=`[[+tags_warning]]` &tpl=`tagItemIcon` &iconClass=`warning``
    ]]]]
</span>