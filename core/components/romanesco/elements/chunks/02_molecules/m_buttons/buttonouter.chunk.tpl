[[+new_line:eq=`1`:then=`<br>`]]
[[modifiedIf?
    &subject=`[[+icon_class:empty=``]]`
    &operator=`isnot`
    &operand=``
    &then=`buttonHrefIcon`
    &else=`buttonHrefBasic`
    &outputAsTpl=`1`

    &link=`[[+link]]`
    &button_text=`[[+button_text]]`
    &classes=`[[+button_size]] [[+button_type]] [[+button_options:replace=`,== `]] [[+icon_options:replace=`,== `]] [[+icon_class:notempty=`icon`]]`
    &attributes=`[[+new_window:eq=`1`:then=`target="_blank"`]] [[+button_title:notempty=`title="[[+button_title]]"`]]`
    &icon_class=`[[+icon_class]]`
]]