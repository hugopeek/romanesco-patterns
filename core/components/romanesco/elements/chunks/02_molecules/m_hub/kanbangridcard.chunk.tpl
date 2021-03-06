<div class="ui fluid card">
    <div class="content">
        <a class="header" href="[[~[[+id]]]]" target="_blank">
            [[+menutitle:empty=`[[+pagetitle]]`]]
        </a>
        <div class="meta">
            [[+planning_date_due:notempty=`
            <span class="date">
                <i class="small calendar alternate outline icon"></i>
                [[+planning_date_due:strtotime:date=`[[++romanesco.date_format_short]]`]]
            </span>
            `]]
        </div>
        <div class="description">
            [[+longtitle]]
        </div>
    </div>
    <div class="extra content">
        [[+content_owner:notempty=`
        <span class="left floated author">
            <i class="small user icon"></i>
            [[+content_owner:userinfo=`username`]]
        </span>
        `]]
        <span class="right floated actions">
            <a class="small button" href="[[~[[+id]]]]" target="_blank">
                Visit
            </a>
            &bull;
            <a class="small button" href="[[getContextSetting? &context=`web` &setting=`site_url`]]manager/?a=resource/update&id=[[+id]]" target="_blank">
                Edit
            </a>
        </span>
    </div>
</div>