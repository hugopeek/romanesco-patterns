<[[+title_hierarchy]] class="ui [[+de_emphasize:is=`1`:then=`sub`]] header">
    <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
</[[+title_hierarchy]]>

[[!If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`<p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>`
]]
[[!If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<p><a href="[[~[[+id]]]]" class="ui [[+de_emphasize:is=`1`:then=`small`:else=`primary`]] button">[[+link_text]]</a></p>`
]]