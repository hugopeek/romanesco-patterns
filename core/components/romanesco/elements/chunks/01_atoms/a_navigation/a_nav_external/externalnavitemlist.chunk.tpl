<div class="[[+classes]] item">
    <div class="image">
        <a class="ui circular label" href="[[~[[*id]]]]#reference-[[+number]]">[[+number]]</a>
    </div>
    <div class="content">
        [[+title:notempty=`
        <div class="header">
            [[+title]]
            [[+date_accessed:notempty=`
            <i class="small muted calendar alternate outline icon" title="[[%romanesco.external.accessed_on]] [[+date_accessed:strtotime:date=`[[++romanesco.date_format_short]]`]]"></i>
            `]]
        </div>
        `]]
        <div class="small description">
            [[If?
                &subject=`[[+url]]`
                &operator=`notempty`
                &then=`<a href="[[+url]]" target="_blank">[[+description:empty=`[[+url]]`]]</a>`
                &else=`[[+description]]`
            ]]
        </div>
    </div>
</div>