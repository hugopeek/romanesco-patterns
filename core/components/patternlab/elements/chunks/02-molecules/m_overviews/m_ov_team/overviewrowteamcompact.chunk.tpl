<a class="ui avatar image" href="[[~[[+id]]]]">
    [[ImagePlus:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`?
        &tvname=`team_member_image`
        &docid=`[[+id]]`
        &options=`w=150&h=150&zc=1`
        &type=`tpl`
        &tpl=`cbOverviewRowImg`
    ]]
</a>

<div class="content">
    <a href="[[~[[+id]]]]" class="header">[[+tv.team_member_firstname]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<div class="description">[[+tv.team_member_jobtitle]]</div>`
    ]]
</div>