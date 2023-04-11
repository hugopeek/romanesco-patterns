[[+url:notempty=`
[[[[modifiedIf?
    &subject=`[[+extension:lcase]]`
    &operator=`EQ`
    &operand=`svg`
    &then=`$svg? &classes=`ui svg image` &url=`[[+url]]` &alt=`[[+alt]]` &uid=`[[+unique_idx]]_[[+idx]]``
    &else=`$imgResponsiveGalleryCaption? &alt=`[[+alt]]` &uid=`[[+unique_idx]]_[[+idx]]``
]]]]
`]]