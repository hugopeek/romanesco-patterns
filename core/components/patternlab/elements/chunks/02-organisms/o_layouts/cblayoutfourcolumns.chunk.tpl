[[!If:toPlaceholder=`container_type`?
    &subject=`[[*parent]]`
    &operator=`EQ`
    &operand=`[[++patternlab.blog_container_id]]`
    &then=`[[If? &subject=`[[+full_width]]` &operator=`EQ` &operand=`1` &then=`` &else=`text`]]`
    &else=`[[If? &subject=`[[+full_width]]` &operator=`EQ` &operand=`1` &then=`fluid`]]`
]]

<div class="ui vertical stripe segment [[+background]]">
    <div class="ui [[!+container_type]] container">
        <div class="ui four column stackable doubling [[+padding]] [[+alignment]] grid">
            <div class="column">[[+col_1]]</div>
            <div class="column">[[+col_2]]</div>
            <div class="column">[[+col_3]]</div>
            <div class="column">[[+col_4]]</div>
        </div>
    </div>
</div>