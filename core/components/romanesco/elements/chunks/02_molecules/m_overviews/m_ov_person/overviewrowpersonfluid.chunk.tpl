<div class="column">
    [[$imgOverviewPersonLink? &classes=`circular` &uid=`[[+unique_idx]]`]]
</div>

<div class="[[+cols]] wide floated column">
    <h2 class="ui header">
        <a href="[[~[[+id]]]]">[[+person_firstname]]</a>
        <span class="sub header">[[+person_jobtitle]]</span>
    </h2>
    <p>
        [[$socialConnectButtonsPerson? &uid=`[[+unique_idx]]`]]
    </p>
    [[+introtext]]
    [[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`<p>[[$buttonHrefOverview? &uid=`[[+unique_idx]]`]]</p>`
    ]]
</div>