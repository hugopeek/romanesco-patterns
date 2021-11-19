[[+title:notempty=`
<div class="header">
    <strong>[[+title]]</strong>
</div>
`]]
<div class="content">
    [[+description:notempty=`<div>[[+description:stripTags:htmlent]]</div>`]]
    [[+date_accessed:notempty=`
    <div class="meta">[[%romanesco.external.accessed_on]] [[+date_accessed:strtotime:date=`[[++romanesco.date_format_short]]`]]</div>
    `]]
    [[+url:notempty=`
    <div class="ui divider"></div>
    <a class="ui tiny compact right labeled icon button" href="[[+url]]" target="_blank">
        [[%romanesco.external.visit_source]]
        <i class="external alternate icon"></i>
    </a>
    `]]
</div>
