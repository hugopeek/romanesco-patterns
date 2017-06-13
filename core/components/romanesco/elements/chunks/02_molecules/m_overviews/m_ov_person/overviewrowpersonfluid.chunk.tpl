<div class="column">
    [[!$imgOverviewPersonLink? &classes=`[[++img_corner_type]]`]]
</div>

<div class="[[+cols]] wide floated column">
    <h2 class="ui header">
        <a href="[[~[[+id]]]]">[[+person_firstname]]</a>
        <div class="sub header">[[+person_jobtitle]]</div>
    </h2>
    <p>
        [[!$socialConnectButtonsPerson]]
    </p>
    [[+introtext]]
    [[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`<p>[[!$buttonHrefOverview]]</p>`
    ]]
</div>