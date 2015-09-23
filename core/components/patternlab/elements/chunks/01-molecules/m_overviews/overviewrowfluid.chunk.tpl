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

<section class="ui vertical stripe segment [[+background]]">
    <div class="ui container">
        <div class="ui stackable equal width grid [[+interchange]]">
            [[!$[[+row_tpl]]]]
        </div>
    </div>
</section>