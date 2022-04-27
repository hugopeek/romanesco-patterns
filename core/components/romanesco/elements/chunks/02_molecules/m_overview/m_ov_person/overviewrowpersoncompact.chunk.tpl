[[$imgOverviewPersonAvatarLink? &uid=`[[+unique_idx]]`]]

<div class="content">
    <a href="[[~[[+id]]]]" class="header">[[+person_firstname:empty=`[[+pagetitle]]`]]</a>
    [[If?
        &subject=`[[+show_subtitle]]`
        &operator=`EQ`
        &operand=`1`
        &then=`<div class="description">[[+person_jobtitle:empty=`[[+longtitle]]`]]</div>`
    ]]
</div>