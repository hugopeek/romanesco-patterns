<div class="image column">
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[+tv.overview_image:empty=`[[$cbOverviewRowImgFallback]]`]]
    </a>
</div>
<div class="[[+cols]] wide middle aligned content column">
    <h2 class="ui header">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    </h2>
    <p class="meta">
        <img class="ui avatar image" src="[[pThumb? &input=`[[++overview_img_fallback]]` &options=`w=150&h=150&zc=1`]]">
        <span class="meta"><em>Geschreven door <a href="#">[[+createdby:userinfo=`fullname`:empty=`Daniel Hoopman`]]</a> op [[+publishedon:strtotime:date=`%e %B %Y`]]</em></span>
    </p>
    <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    <p><a href="[[~[[+id]]]]" class="ui primary button">[[+link_text]]</a></p>
</div>