<div [[stripAsAlias:prepend=`id="`:append=`"`? &input=`[[+title]]`]] class="ui vertical stripe segment [[setBackground? &background=`[[+background]]`]]">
    <div class="ui [[+container_type]] container">
        <div class="ui two column [[+responsive:replace=`,== `]] [[+padding]] [[+alignment]] [[+divider]] grid">
            <div class="row">
                <div class="[[+title_inflate]] main column">[[+col_1]]</div>
                <div class="[[+title_inflate]] main column">[[+col_2]]</div>
            </div>
        </div>
    </div>
    [[+bg[[+background]].credits]]
</div>
