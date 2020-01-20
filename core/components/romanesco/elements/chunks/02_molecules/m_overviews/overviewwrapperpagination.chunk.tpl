[[- HACKERMAN ALERT
    The pagination wrapper is being added again inside the paging container by
    getPage, I guess because the same getResources call is run again.

    To prevent the extra wrapper (with empty pagination container) from being
    parsed, we set a startPage placeholder that remains the same because its
    cached and compare it to an uncached [[+page]] value. If they differ, the
    wrapper is already there and we supply just the output instead.
]]
[[+page:toPlaceholder=`startPage`]]
[[+startPage:eq=`[[!+page]]`:then=`
<div id="[[If? &subject=`[[+prefix]]` &operator=`is` &operand=`ov__` &then=`ov_[[Time]]` &else=`[[+prefix]]`]]">
    [[$overviewWrapper? &uid=`[[+idx]][[+page]][[+unique_idx]]`]]
    [[[[If?
        &subject=`[[$paginationFluidTheme]]`
        &operator=`isnull`
        &then=`$paginationFluid? &prefix=`[[+prefix]]``
        &else=`$paginationFluidTheme? &prefix=`[[+prefix]]``
    ]]]]
</div>
`:else=`
    [[+output]]
`]]