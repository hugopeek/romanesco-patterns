[[-$imgOverviewPersonLink? &uid=`[[+unique_idx]]`]]

<div class="ui overlay">
    <[[+level]] class="ui [[+title_classes]] inverted header">
        [[+[[+title_field]]:empty=`[[+pagetitle]]`]]
        [[If?
            &subject=`[[+show_subtitle]]`
            &operator=`eq`
            &operand=`1`
            &then=`<span class="sub header">[[+person_jobtitle:empty=`[[+longtitle]]`]]</span>`
        ]]
    </[[+level]]>

    [[If?
        &subject=`[[+link_text]]`
        &operator=`isnot`
        &operand=`0`
        &then=`<p>[[$buttonHrefOverview? &button_classes=`basic [[+button_classes]]` &uid=`[[+unique_idx]]`]]</p>`
    ]]
</div>
