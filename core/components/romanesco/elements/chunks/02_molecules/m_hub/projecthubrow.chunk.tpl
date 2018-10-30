<div class="[[!If? &subject=`[[+date:strtotime]]` &operator=`GT` &operand=`[[!Time]]` &then=`future` &else=`past`]] event">
    <div class="label">
        <i class="[[+icon]] icon"></i>
    </div>
    <div class="content">
        [[+date:notempty=`
        <div class="date">
            [[+date:date=`[[++romanesco.date_format_long]]`]]
        </div>
        `]]
        [[+title:notempty=`
        <div class="summary">
            [[+title]]
        </div>
        `]]
        [[+description:notempty=`
        <div class="expandable extra text">
            [[+description]]
        </div>
        `]]
    </div>
</div>