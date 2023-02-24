[[+url:notempty=`
[[[[modifiedIf?
    &subject=`[[+extension:lcase]]`
    &operator=`EQ`
    &operand=`svg`
    &then=`$imageSVG? &url=`[[+url]]` &alt=`[[+alt]]``
    &else=`$imgResponsiveGalleryCaption? &alt=`[[+alt]]` &uid=`[[+unique_idx]]_[[+idx]]``
]]]]
`]]