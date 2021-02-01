[[setUserPlaceholders? &userId=`[[+author_id]]` &uid=`[[+unique_idx]]`]]

<div class="column">
    <a class="ui rounded image" href="[[~[[+id]]]]">
        [[ImagePlus:empty=`[[$cbOverviewRowImgFallback? &img_type=`landscape`]]`?
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
        [[[[If?
            &subject=`[[+team_member_id]]`
            &operator=`notempty`
            &then=`$imgOverviewPersonAvatarLink? &id=`[[+team_member_id]]``
        ]]]]
        <span class="meta">
            <em>
                [[%romanesco.article.written_by]]
                [[If?
                    &subject=`[[+author_id]]`
                    &operator=`notempty`
                    &then=`<a href="[[~[[+team_member_id:empty=`[[++error_page]]`]]]]">[[+author_id:userinfo=`fullname`:empty=`[[++site_name]]`]]</a>`
                    &else=`[[+createdby:userinfo=`fullname`:empty=`[[++site_name]]`]]`
                ]]
                [[%romanesco.article.written_on]]
                [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
            </em>
        </span>
    </p>
    <p>[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
    <p><a href="[[~[[+id]]]]" class="ui primary button">[[+link_text]]</a></p>
</div>