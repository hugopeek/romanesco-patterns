<div [[stripAsAlias:prepend=`id="`:append=`"`? &input=`[[+title]]`]] class="ui vertical stripe segment [[setBackground? &background=`[[+background]]`]]">
    <div class="ui [[+container_type]] container">
        <div class="ui four column [[+responsive:replace=`,== `]] [[+padding]] [[+alignment]] [[+divider]] grid">
            <div class="row">
                <div class="column">[[+col_1]]</div>
                <div class="column">[[+col_2]]</div>
                <div class="column">[[+col_3]]</div>
                <div class="column">[[+col_4]]</div>
            </div>
        </div>
    </div>
    [[+bg[[+background]].credits]]
</div>
