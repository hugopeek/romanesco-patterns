[[+image:notempty=`
<a href="[[+link]]" class="image">
    <img src="[[pthumb? &input=`[[+image]]` &options=`w=[[++max_thumb_width]]&zc=1`]]" alt="[[+heading]]">
</a>
`]]
<div class="content">
    [[+heading:notempty=`
    <a href="[[+link]]">
        <[[+heading_level]] class="header">[[+heading]]</[[+heading_level]]>
    </a>
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