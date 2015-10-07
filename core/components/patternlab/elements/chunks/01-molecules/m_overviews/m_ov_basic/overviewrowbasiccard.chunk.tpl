<div class="content">
    <[[+title_hierarchy]] class="[[+de_emphasize:is=`1`:then=`sub`]] header">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    </[[+title_hierarchy]]>

    [[!If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>`
    ]]
</div>

[[!If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<a href="[[~[[+id]]]]" class="ui bottom attached [[+de_emphasize:is=`1`:then=`small`:else=`primary`]] button">[[+link_text]]</a>`
]]