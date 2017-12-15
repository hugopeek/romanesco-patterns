[[+image:notempty=`
<div class="image">
    <img src="[[pthumb? &input=`[[+image]]` &options=`w=[[++max_thumb_width]]&zc=1`]]" alt="[[+heading]]">
</div>
`]]
<div class="content">
    [[+heading:notempty=`
    <div class="header">
        <[[+heading_level]]>[[+heading]]</[[+heading_level]]>
    </div>
    `]]
    [[+subtitle:notempty=`
    <div class="meta">[[+subtitle]]</div>
    `]]
    [[+content:notempty=`
    <div class="description">
        [[+content]]
    </div>
    `]]
</div>