<div class="[[+content_type:eq=`extra`:then=`extra`]] content">
    [[If?
        &subject=`[[+right]]`
        &operator=`notempty`
        &then=`
        <div class="right floated">
            [[+right]]
        </div>`
    ]]
    [[If?
        &subject=`[[+content_type]]`
        &operator=`inarray`
        &operand=`header,meta,description`
        &then=`
        <div class="[[+content_type]]">
            [[+main]]
        </div>`
        &else=`[[+main]]`
    ]]
</div>