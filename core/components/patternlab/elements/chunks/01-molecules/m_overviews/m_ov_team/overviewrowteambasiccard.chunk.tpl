<a class="ui image" href="[[~[[+id]]]]">
    [[ImagePlus:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`?
        &tvname=`team_member_image`
        &docid=`[[+id]]`
        &options=`w=800&h=800&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
</a>

<div class="center aligned content">
    <a href="[[~[[+id]]]]" class="header">[[+tv.team_member_firstname]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<p class="meta">[[+tv.team_member_jobtitle]]</p>`
    ]]

    [[!$socialConnectButtonsTeam? &button_type=`basic`]]
</div>

[[If?
    &subject=`[[+link_text]]`
    &operator=`isnot`
    &operand=`0`
    &then=`[[!$buttonHrefOverview? &classes=`bottom attached`]]`
]]