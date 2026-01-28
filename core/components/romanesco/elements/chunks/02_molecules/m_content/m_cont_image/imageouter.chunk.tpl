[[If?
    &subject=`[[+extension:lcase]]`
    &operator=`is`
    &operand=`svg`
    &then=`imageSVG`
    &else=`imageBasic[[+link:notempty=`Link`]][[+lightbox:eq=`1`:then=`Lightbox`]]`
    &toPlaceholder=`[[+unique_idx]].img_tpl`
]]
[[$[[+[[+unique_idx]].img_tpl]]?
    &url=`[[+crops.default.url:empty=`[[+url]]`]]`
    &width=`[[+crops.default.width:empty=`[[+width]]`]]`
    &height=`[[+crops.default.height:empty=`[[+height]]`]]`
    &classes=`rounded [[+classes:empty=`[[+img_size]] [[+options]] [[+enlarge]] [[+position]]`:replace=`,== `]]`
    &attributes=`[[+link_rel:replace=`,== `:prepend=`rel="`:append=`"`]] [[+new_window:eq=`1`:then=`target="_blank"`]]`

    &layout_id=`[[+layout_id]]`
    &layout_column=`[[+layout_column]]`
    &uid=`[[+unique_idx]]`
]]