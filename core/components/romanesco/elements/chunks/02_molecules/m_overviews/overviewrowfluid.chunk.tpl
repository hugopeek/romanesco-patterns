[[!If:toPlaceholder=`background`?
    &subject=`[[+idx:mod]]`
    &operator=`EQ`
    &operand=`0`
    &then=`[[+background_even]]`
    &else=`[[+background_odd]]`
]]

[[!If:toPlaceholder=`interchange`?
    &subject=`[[+cols_interchange]]`
    &operator=`EQ`
    &operand=`1`
    &then=`[[+idx:mod:eq=`0`:then=`computer reversed tablet reversed`]]`
]]

<section class="ui vertical [[+background]] [[+img_snap:eq=`1`:then=`snapped`]] [[+img_inflate:eq=`1`:then=`inflated`]] stripe segment">
    <div class="ui container">
        <div class="ui stackable equal width middle aligned very relaxed [[+interchange]] grid">
            [[$[[+row_tpl]]? &unique_idx=`[[+idx]][[+unique_idx]]`]]
        </div>
    </div>
</section>