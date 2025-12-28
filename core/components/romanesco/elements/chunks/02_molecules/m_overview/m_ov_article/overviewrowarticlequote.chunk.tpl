<div class="ui padded down pointing segment secondary">
    <[[+level]]>
        <a href="[[~[[+id]]]]">[[+[[+title_field]]:empty=`[[+pagetitle]]`]]</a>
    </[[+level]]>
    <p class="quote">[[+introtext:stripString=`<p>`:stripString=`</p>`]]</p>
</div>

<div class="ui basic segment">
    [[$imgOverviewPersonAvatarLink? &id=`[[+author_id]]`]]
    <span class="meta">
        <em>
            [[%romanesco.article.written_by]]
            <a href="[[~[[+author_id:empty=`[[++error_page]]`]]]]">[[#[[+author_id]].pagetitle:empty=`[[++site_name]]`]]</a>
            [[%romanesco.article.written_on]]
            [[+publishedon:strtotime:date=`[[++romanesco.date_format_long]]`]]
        </em>
    </span>
    [[[[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`$buttonHrefOverview? &button_classes=`right floated [[+button_classes]]` &uid=`[[+unique_idx]]``
    ]]]]
</div>