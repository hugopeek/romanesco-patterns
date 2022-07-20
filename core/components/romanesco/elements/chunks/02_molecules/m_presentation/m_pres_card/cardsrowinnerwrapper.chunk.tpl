[[If?
    &subject=`[[+box_type]][[+link:eq=``:then=`break`]]`
    &operator=`is`
    &operand=`link`
    &then=`
    <a href="[[+link]]" class="[[+emphasize:eq=`1`:then=`ui raised`]] link card">
        [[$cardsRowBasicLink? &uid=`[[+unique_idx]]`]]
    </a>`
    &else=`
    <div class="[[+emphasize:eq=`1`:then=`ui raised`]] card">
        [[$cardsRowBasic[[+link:eq=``:then=`Link`]]? &uid=`[[+unique_idx]]`]]
    </div>`
]]