<div [[stripAsAlias:prepend=`id="`:append=`"`? &input=`[[+title]]`]] class="ui vertical stripe segment [[setBackground? &background=`[[+background]]`]]">
    <div class="ui [[+container_type]] container">
        <div class="ui [[+responsive:replace=`,== `]] [[+padding]] [[+alignment]] [[+divider]] equal width grid">
            <div class="row">
                <div class="[[+sidebar_width]] wide sidebar column">[[+sidebar]]</div>
                <div class="[[+title_inflate]] main column">[[+main]]</div>
            </div>
        </div>
    </div>
</div>
