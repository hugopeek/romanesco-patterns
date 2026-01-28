<div class="ui stackable grid">
    <figure class="five wide column">
        [[$overviewRowImageBasic? &uid=`[[+unique_idx]]`]]
    </figure>

    <div class="eleven wide [[If? &subject=`[[+show_introtext]]` &operator=`eq` &operand=`0` &then=`middle aligned`]] column">
        [[$overviewRowBasic? &uid=`[[+unique_idx]]`]]
    </div>
</div>