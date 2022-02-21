[[modifiedIf?
    &subject=`[[+extension:lcase]]`
    &operator=`EQ`
    &operand=`svg`
    &then=`imageSVG`
    &else=`imageBasic[[+link:notempty=`Link`]]`
    &toPlaceholder=`img_type`
]]

[[$[[+img_type]]?
    &url=`[[+crops.default.url:empty=`[[+url]]`]]`
    &width=`[[+crops.default.width:empty=`[[+width]]`]]`
    &height=`[[+crops.default.height:empty=`[[+height]]`]]`
    &classes=`rounded [[+classes:replace=`,== `:empty=`[[+img_size]] [[+options]] [[+position]]`]]`

    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
    &uid=`[[+unique_idx]]`
]]