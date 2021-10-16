[[+image:notempty=`
<a href="[[+link]]" class="image">
    <img src="[[pthumb:imgOptimizeThumb? &input=`[[+image]]` &options=`w=[[++max_thumb_width]]&q=[[++romanesco.img_quality]]&zc=1`]]" alt="[[+heading]]">
</a>
`]]
<div class="content">
    [[+heading:notempty=`
    <[[+level]] class="header">
        <a href="[[+link]]">[[+heading]]</a>
    </[[+level]]>
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
[[+button_text:notempty=`
<div class="center aligned extra content">
    <a href="[[+link]]" class="ui primary button">[[+button_text]]</a>
</div>
`]]