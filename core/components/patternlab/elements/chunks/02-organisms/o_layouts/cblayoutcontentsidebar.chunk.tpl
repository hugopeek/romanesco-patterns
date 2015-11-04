[[!If:toPlaceholder=`container_type`?
    &subject=`[[*parent]]`
    &operator=`EQ`
    &operand=`[[++patternlab.blog_container_id]]`
    &then=`[[If? &subject=`[[+full_width]]` &operator=`EQ` &operand=`1` &then=`` &else=`text`]]`
    &else=`[[If? &subject=`[[+full_width]]` &operator=`EQ` &operand=`1` &then=`fluid`]]`
]]

<div class="ui vertical stripe segment [[+background]]">
    <div class="ui [[!+container_type]] container">
        <div class="ui stackable doubling [[+padding]] [[+alignment]] grid">
            <div class="ten wide column">[[+main]]</div>
            <div class="six wide column">[[+sidebar]]</div>
        </div>
    </div>
</div>