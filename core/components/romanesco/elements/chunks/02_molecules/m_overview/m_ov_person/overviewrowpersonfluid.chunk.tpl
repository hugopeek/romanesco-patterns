<div class="sidebar column">
    [[$imgOverviewPersonLink? &classes=`circular` &uid=`[[+unique_idx]]`]]
</div>

<div class="[[+content_width]] wide [[+title_inflate]] main column">
    <[[+level]] class="ui [[+title_classes]] header">
        <a href="[[~[[+id]]]]">[[+person_firstname]]</a>
        <span class="sub header">[[+person_jobtitle]]</span>
    </[[+level]]>
    <p>
        [[$socialConnectButtonsPerson? &uid=`[[+unique_idx]]`]]
    </p>
    [[[[If?
        &subject=`[[+show_introtext]]`
        &operator=`EQ`
        &operand=`1`
        &then=`$introtextDescription? &uid=`[[+unique_idx]]``
    ]]]]
    [[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`<p>[[$buttonHrefOverview? &uid=`[[+unique_idx]]`]]</p>`
    ]]
</div>