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
    &then=`[[!$buttonHrefOverview? &classes=`bottom attached`]]`
]]