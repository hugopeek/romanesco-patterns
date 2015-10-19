<a class="ui avatar image" href="[[~[[+id]]]]">
    [[+tv.team_member_image:empty=`[[$cbOverviewRowImgFallback? &mpy=`1`]]`]]
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