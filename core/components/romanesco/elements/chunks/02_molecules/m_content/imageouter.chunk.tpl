[[modifiedIf?
    &subject=`[[+extension:lcase]]`
    &operator=`EQ`
    &operand=`svg`
    &then=`imageSVG`
    &else=`imageBasic[[+link:notempty=`Link`]]`
    &outputAsTpl=`1`

    &url=`[[+crops.default.url:empty=`[[+url]]`]]`
    &width=`[[+crops.default.width:empty=`[[+width]]`]]`
    &width=`[[+crops.default.height:empty=`[[+height]]`]]`
    &classes=`rounded [[+classes:replace=`,== `:empty=`[[+img_size]] [[+options]] [[+position]]`]]`
]]