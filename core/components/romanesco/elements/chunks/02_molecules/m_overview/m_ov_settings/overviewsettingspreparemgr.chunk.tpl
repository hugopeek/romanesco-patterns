[[If? &subject=`[[+user_access_level]]` &operator=`empty` &then=`` &toPlaceholder=`user_access_level`]]

<div class="ui message">[[%romanesco.cb.overview_preview_note? &topic=`manager` &namespace=`romanescobackyard`]]</div>
<div class="ui hidden divider"></div>

[[If?
    &subject=`[[+limit:replace=`0==999`]]`
    &operator=`lt`
    &operand=`[[+cols:textToNumber:mpy=`2`]]`
    &then=`[[+limit]]`
    &else=`[[+cols:textToNumber:mpy=`2`]]`
    &toPlaceholder=`limit_mgr`
]]