[[If:toPlaceholder=`btn_[[+unique_idx]].attributes`?
    &subject=`[[+new_window]]`
    &operator=`EQ`
    &operand=`1`
    &then=`target="_blank"`
    &else=``
]]

[[If?
    &subject=`[[+icon_class:empty=``]]`
    &operator=`isnot`
    &operand=``
    &then=`
        [[$buttonHrefIcon?
            &link=`[[+link]]`
            &button_text=`[[+button_text]]`
            &classes=`[[+button_size]] [[+button_type]] [[+button_options:replace=`,== `]] [[+icon_options:replace=`,== `]] icon`
            &attributes=`[[+btn_[[+unique_idx]].attributes]]`
            &icon_class=`[[+icon_class]]`
        ]]
    `
    &else=`
        [[$buttonHrefBasic?
            &link=`[[+link]]`
            &button_text=`[[+button_text]]`
            &classes=`[[+button_size]] [[+button_type]] [[+button_options:replace=`,== `]]`
            &attributes=`[[+btn_[[+unique_idx]].attributes]]`
        ]]
    `
]]