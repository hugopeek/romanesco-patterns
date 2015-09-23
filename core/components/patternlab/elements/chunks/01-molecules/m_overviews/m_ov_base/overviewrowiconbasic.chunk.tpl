[[-
<figure>
    <img class="ui centered image" src="[[+tv.overview_icon_svg]]" alt="[[+pagetitle]]">
</figure>
<div class="content">
    <h2><a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a></h2>
    [[+show_introtext:is=`1`:then=`<p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>`]]
</div>
<a href="[[~[[+id]]]]" class="ui bottom attached [[+de_emphasize:ne=`1`:then=`large primary`]] button">[[+link_text]]</a>
]]

<h2 class="ui icon header">
    <figure class="icon">
        <img src="[[+tv.overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">
    </figure>
    <div class="content">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
        <div class="sub header">[[+longtitle]]</div>
    </div>
</h2>
<div class="content">
    [[+show_introtext:is=`1`:then=`<p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>`]]
</div>
<a href="[[~[[+id]]]]" class="ui [[+de_emphasize:ne=`1`:then=`large primary`]] button">[[+link_text]]</a>
