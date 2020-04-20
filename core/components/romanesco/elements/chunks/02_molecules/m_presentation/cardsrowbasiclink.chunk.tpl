[[+image:notempty=`
<div class="image">
    <img src="[[pthumb? &input=`[[+image]]` &options=`w=[[++max_thumb_width]]&q=[[++img_quality]]&zc=1`]]" alt="[[+heading]]">
</div>
`]]
<div class="content">
    [[+heading:notempty=`
    <div class="header">
        <[[+level]]>[[+heading]]</[[+level]]>
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