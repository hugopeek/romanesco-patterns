[[+new_line:eq=`1`:then=`<br>`]]
[[modifiedIf?
    &subject=`[[+icon_class:empty=``]]`
    &operator=`notempty`
    &then=`buttonHrefIcon`
    &else=`buttonHrefBasic`
    &toPlaceholder=`button_tpl`
]]
[[$[[+button_tpl]]?
    &link=`[[+link]][[+link_anchor:prepend=`#`]]`
    &button_text=`[[+button_text]]`
    &classes=`[[+button_size]] [[+button_type]] [[+button_options:replace=`,== `]] [[+icon_options:replace=`,== `]] [[+icon_class:notempty=`icon`]]`
    &icon_class=`[[+icon_class]]`
    &attributes=`
        [[+button_title:notempty=`title="[[+button_title]]"`]]
        [[+new_window:eq=`1`:then=`target="_blank"`]]
        [[+link_rel:replace=`,== `:prepend=`rel="`:append=`"`]]
        [[+attributes]]
    `
    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
    &uid=`[[+unique_idx]]`
]]