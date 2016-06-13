<div class="column">
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$cbOverviewRowImgFallback]]`?
            &tvname=`overview_img_landscape`
            &docid=`[[+id]]`
            &options=``
            &type=`tpl`
            &tpl=`cbOverviewRowImg`
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