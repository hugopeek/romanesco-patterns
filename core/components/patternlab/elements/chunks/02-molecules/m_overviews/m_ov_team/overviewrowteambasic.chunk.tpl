<a class="ui circular image" href="[[~[[+id]]]]">
    [[ImagePlus:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`?
        &tvname=`team_member_image`
        &docid=`[[+id]]`
        &options=`w=800&h=800&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
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

[[If?
    &subject=`[[+show_introtext]]`
    &operator=`EQ`
    &operand=`1`
    &then=`[[!$introtextDescription]]`
]]

<p>
    [[!$socialConnectButtonsTeam? &button_type=`basic`]]
</p>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`<p>[[!$buttonHrefOverview]]</p>`
]]