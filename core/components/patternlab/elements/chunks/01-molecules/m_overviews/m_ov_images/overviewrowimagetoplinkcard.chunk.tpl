<a class="ui rounded image" href="[[~[[+id]]]]">
    [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
</a>

<div class="content">
    <h2><a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a></h2>
    [[+show_introtext:is=`1`:then=`<p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>`]]
</div>

[[!If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<a href="[[~[[+id]]]]" class="ui bottom attached [[+de_emphasize:is=`1`:then=`small`:else=`primary`]] button">[[+link_text]]</a>`
]]