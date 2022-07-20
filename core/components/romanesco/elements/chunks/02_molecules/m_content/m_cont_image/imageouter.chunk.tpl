[[modifiedIf?
    &subject=`[[+extension:lcase]]`
    &operator=`EQ`
    &operand=`svg`
    &then=`imageSVG`
    &else=`imageBasic[[+link:notempty=`Link`]]`
    &toPlaceholder=`img_tpl`
]]
[[$[[+img_tpl]]?
    &url=`[[+crops.default.url:empty=`[[+url]]`]]`
    &width=`[[+crops.default.width:empty=`[[+width]]`]]`
    &height=`[[+crops.default.height:empty=`[[+height]]`]]`
    &classes=`rounded [[+classes:replace=`,== `:empty=`[[+img_size]] [[+options]] [[+position]]`]]`
    &attributes=`[[+link_rel:replace=`,== `:prepend=`rel="`:append=`"`]] [[+new_window:eq=`1`:then=`target="_blank"`]]`

    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
    &uid=`[[+unique_idx]]`
]]