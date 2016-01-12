[[!setUserPlaceholders? &userId=`[[+tv.article_author]]`]]

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
<div class="[[+cols]] wide middle aligned column">
    <h2 class="ui header">
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    </h2>
    <p>
        <a href="[[~[[+id]]]]" class="ui avatar image">
            <img src="[[ImagePlus:empty=`[[++overview_img_fallback]]`? &tvname=`team_member_image` &docid=`[[+team_member_id]]` &options=`w=150&h=150&zc=1` &type=`thumb`]]">
        </a>
        <span class="meta">
            <em>[[%patternlab.blog.written_by]] <a href="[[~[[+team_member_id]]]]">[[+tv.article_author:userinfo=`fullname`:empty=`[[++site_name]]`]]</a> [[%patternlab.blog.written_on]] [[+publishedon:strtotime:date=`%e %B %Y`]]</em>
        </span>
    </p>
    <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    <p><a href="[[~[[+id]]]]" class="ui primary button">[[+link_text]]</a></p>
</div>