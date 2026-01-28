[[If?
    &subject=`[[+idx:mod]]`
    &operator=`eq`
    &operand=`0`
    &then=`[[+background_even]]`
    &else=`[[+background_odd]]`
    &toPlaceholder=`background.[[+idx]]`
]]
[[If?
    &subject=`[[+cols_interchange]]`
    &operator=`eq`
    &operand=`1`
    &then=`[[+idx:mod:eq=`0`:then=`computer reversed tablet reversed`]]`
    &toPlaceholder=`interchange.[[+idx]]`
]]

<section class="ui vertical [[+background.[[+idx]]]] stripe segment">
    <div class="ui container">
        <div class="ui stackable equal width middle aligned [[+padding]] [[+interchange.[[+idx]]]] grid center when stacked">
            [[$[[+row_tpl]]? &unique_idx=`[[+idx]][[+unique_idx]]`]]
        </div>
    </div>
</section>