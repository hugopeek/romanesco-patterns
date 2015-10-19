<a class="ui image" href="[[~[[+id]]]]">
    [[+tv.team_member_image:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`]]
</a>

<div class="center aligned content">
    <a href="[[~[[+id]]]]" class="header">[[+tv.team_member_firstname]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<p class="meta">[[+tv.team_member_jobtitle]]</p>`
    ]]

    [[If?
        &subject=`[[+tv.team_member_twitter]]`
        &operator=`notempty`
        &then=`<a href="[[+tv.team_member_twitter]]" class="ui circular twitter icon button"><i class="twitter icon"></i></a>`
    ]]
    [[If?
        &subject=`[[+tv.team_member_linkedin]]`
        &operator=`notempty`
        &then=`<a href="[[+tv.team_member_linkedin]]" class="ui circular linkedin icon button"><i class="linkedin icon"></i></a>`
    ]]
</div>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<a href="[[~[[+id]]]]" class="ui bottom attached [[+de_emphasize:is=`1`:then=`small`:else=`large primary`]] button">[[+link_text]]</a>`
]]