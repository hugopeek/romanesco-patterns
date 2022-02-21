[[+url:notempty=`
[[[[modifiedIf?
    &subject=`[[+extension:lcase]]`
    &operator=`EQ`
    &operand=`svg`
    &then=`svgSanitize? &file=`[[+url]]` &title=`[[+alt]]``
    &else=`$imgResponsiveGalleryCaption? &uid=`[[+unique_idx]]_[[+idx]]``
]]]]
`]]