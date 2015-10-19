<a class="ui circular image" href="[[~[[+id]]]]">
    [[+tv.team_member_image:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`]]
</a>

<[[+title_hierarchy]] class="ui header">
    <a href="[[~[[+id]]]]">[[+tv.team_member_firstname]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<p class="sub header">[[+tv.team_member_jobtitle]]</p>`
    ]]
</[[+title_hierarchy]]>

<p>
    [[!If?
        &subject=`[[+tv.team_member_twitter]]`
        &operator=`notempty`
        &then=`<a href="[[+tv.team_member_twitter]]" class="ui circular twitter icon button"><i class="twitter icon"></i></a>`
    ]]
    [[!If?
        &subject=`[[+tv.team_member_linkedin]]`
        &operator=`notempty`
        &then=`<a href="[[+tv.team_member_linkedin]]" class="ui circular linkedin icon button"><i class="linkedin icon"></i></a>`
    ]]
</p>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<p>[[!$buttonHrefOverview]]</p>`
]]