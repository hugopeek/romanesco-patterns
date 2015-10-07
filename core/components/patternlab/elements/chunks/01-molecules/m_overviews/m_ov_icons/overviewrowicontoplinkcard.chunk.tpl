<figure class="icon">
    <img class="ui centered image" src="[[+tv.overview_icon_svg:empty=`[[++overview_icon_fallback]]`]]" alt="[[+pagetitle]]">
</figure>
<div class="content">
    <h2 class="ui centered header">
        [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
        <div class="sub header">[[+longtitle]]</div>
    </h2>
    [[+show_introtext:is=`1`:then=`<p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>`]]
</div>
<a href="[[~[[+id]]]]" class="ui bottom attached [[+de_emphasize:ne=`1`:then=`large primary`]] button">[[+link_text]]</a>