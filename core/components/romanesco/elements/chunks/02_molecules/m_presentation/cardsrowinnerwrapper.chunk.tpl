[[modifiedIf?
    &subject=`[[+box_type]][[+link:eq=``:then=`link`]]`
    &operator=`contains`
    &operand=`link`
    &then=`cardsRowBasicLink`
    &else=`cardsRowBasic`
    &outputAsTpl=`1`
    &toPlaceholder=`card_output`

    &box_type=`[[+box_type]]`
    &link=`[[+link]]`
    &image=`[[+image]]`
    &heading=`[[+heading]]`
    &heading_level=`[[+heading_level]]`
    &subtitle=`[[+subtitle]]`
    &content=`[[+content]]`
    &button_text=`[[+button_text]]`
    &emphasize=`[[+emphasize]]`
]]

[[If?
    &subject=`[[+box_type]][[+link:eq=``:then=`break`]]`
    &operator=`eq`
    &operand=`link`
    &then=`
    <a href="[[+link]]" class="[[+emphasize:eq=`1`:then=`ui raised`]] [[+box_type]] card">
        [[+card_output]]
    </a>`
    &else=`
    <div class="[[+emphasize:eq=`1`:then=`ui raised`]] card">
        [[+card_output]]
    </div>`
]]