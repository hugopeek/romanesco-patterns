<div class="column">
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$imgOverviewFallback]]`?
            &tvname=`overview_img_landscape`
            &docid=`[[+id]]`
            &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`
            &type=`tpl`
            &tpl=`imgOverview`
        ]]
    </a>
</div>
<div class="[[+cols]] wide floated column">
    <h2 class="ui header">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    </h2>
    <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    <p><a href="[[~[[+id]]]]" class="ui primary button">[[+link_text]]</a></p>
</div>