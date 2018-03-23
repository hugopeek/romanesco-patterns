[[!setUserPlaceholders? &userId=`[[+author_id]]`]]

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
            [[ImagePlus:empty=`[[++overview_img_fallback]]`? &tvname=`person_image` &docid=`[[+team_member_id]]` &options=`w=150&h=150&zc=1` &type=`tpl`]]
        </a>
        <span class="meta">
            <em>[[%romanesco.article.written_by]] <a href="[[~[[+team_member_id]]]]">[[+author_id:userinfo=`fullname`:empty=`[[++site_name]]`]]</a> [[%romanesco.article.written_on]] [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]</em>
        </span>
    </p>
    <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    <p><a href="[[~[[+id]]]]" class="ui primary button">[[+link_text]]</a></p>
</div>