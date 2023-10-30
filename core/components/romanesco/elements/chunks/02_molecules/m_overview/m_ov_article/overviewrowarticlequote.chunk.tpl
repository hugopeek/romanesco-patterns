[[setUserPlaceholders? &userId=`[[+author_id]]` &uid=`[[+unique_idx]]`]]

<div class="ui padded down pointing segment secondary">
    <[[+level]]>
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    </[[+level]]>
    <p class="quote">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
</div>

<div class="ui basic segment">
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
    [[[[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`$buttonHrefOverview? &classes=`right floated` &uid=`[[+unique_idx]]``
    ]]]]
</div>