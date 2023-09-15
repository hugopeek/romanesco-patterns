[[- HACKERMAN ALERT
    This pagination wrapper is being added again inside the paging container by
    getPage, I guess because the same getResources call is run again.

    To prevent the extra wrapper (with empty pagination container) from being
    parsed, we set a startPage placeholder that remains the same because its
    cached and compare it to an uncached [[+page]] value. If they differ, the
    wrapper is already there and we return just the output instead.
]]
[[+page:toPlaceholder=`startPage`]]
[[+startPage:eq=`[[!+page]]`:then=`
<div id="[[If? &subject=`[[+prefix]]` &operator=`contains` &operand=`__` &then=`ov_[[Time]]` &else=`[[+prefix]]`]]" class="pagination-wrapper">
    [[$overviewWrapper? &uid=`[[+idx]][[+page]][[+unique_idx]]`]]
    [[$paginationFluid? &prefix=`[[+prefix]]`]]
</div>
`:else=`
    [[+output]]
`]]